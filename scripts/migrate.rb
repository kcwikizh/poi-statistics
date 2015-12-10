require 'mongoid'
require 'pathname'

path = Pathname.new(File.dirname(__FILE__)).realpath.parent

Mongoid.load!("#{path}/config/mongoid.yml", :production)
Dir["#{path}/models/*.rb"].each { |file| load file }

Mongoid.logger.level = Logger::INFO
Mongo::Logger.logger.level = Logger::INFO

migrate_state = nil
if MigrateState.where(data_type: :drop_ship).exists?
  migrate_state = MigrateState.where(data_type: :drop_ship).first
else
  migrate_state = MigrateState.create(data_type: :drop_ship)
  migrate_state.migrate_time = DropShipRecord.first.id.generation_time
  migrate_state.save
end

first_time = migrate_state.migrate_time
last_time = DropShipRecord.last.id.generation_time
migrate_range = {
  from: Time.new(first_time.year, first_time.month, first_time.day, first_time.hour),
  to: Time.new(last_time.year, last_time.month, last_time.day, last_time.hour) - 3600
}

migrate_time = migrate_range[:from]
until migrate_time == migrate_range[:to]
  clock_no = migrate_time.hour
  KanColleConstant.map.each do |map_id, map_obj|
    map_obj[:cells].each do |cell_obj|
      map_func = %Q{
        function() {
          if (this.enemyFormation < 1 || this.enemyFormation > 5) return;
          if (this.enemyShips.length != 6) return;

          val = {
            enemy: {}
          }

          var e = {
            count: 1,
            hqCount: {},
            originCount: {}
          }
          e.hqCount[this.teitokuLv] = 1;
          e.originCount[this.origin] = 1;
          val.enemy[this.enemyShips.join('/') + '/' + this.enemyFormation] = e;

          emit(this.shipId, val);
        }
      }

      reduce_func = %Q{
        function(key, values) {
          var reduced = {
            enemy: {}
          };

          values.forEach(function(value) {
            for(var e in value.enemy) {
              reduced.enemy[e] = reduced.enemy[e] || { count: 0, hqCount: {}, originCount: {} };
              reduced.enemy[e].count += value.enemy[e].count;
              for(var lv in value.enemy[e].hqCount) {
                reduced.enemy[e].hqCount[lv] = reduced.enemy[e].hqCount[lv] || 0;
                reduced.enemy[e].hqCount[lv] += value.enemy[e].hqCount[lv];
              }
              for(var ua in value.enemy[e].originCount) {
                reduced.enemy[e].originCount[ua] = reduced.enemy[e].originCount[ua] || 0;
                reduced.enemy[e].originCount[ua] += value.enemy[e].originCount[ua];
              }
            }
          });

          return reduced;
        }
      }

      (0..3).to_a.each do |level_no|
        next if map_id < 200 && level_no > 0
        next if map_id >= 200 && level_no == 0

        ['S', 'A', 'B', 'C', 'D', 'E'].each do |rank|
          DropShipRecord.where(
            :id.gte             => BSON::ObjectId.from_time(migrate_time),
            :id.lt              => BSON::ObjectId.from_time(migrate_time + 3600),
            :mapId              => map_id,
            :quest              => map_obj[:name],
            :cellId.in          => cell_obj[:index],
            :enemy              => cell_obj[:name],
            :mapLv              => level_no,
            :rank               => rank,
            :origin             => /^(?!KCV)/)
            .map_reduce(map_func, reduce_func)
            .out(inline: 1).each do |query|
              query['value']['enemy'].each do |flt, cnt|
                fleet = flt.split('/').map(&:to_i)
                DropShipStatistic.create(
                  ship_id: query['_id'].to_i,
                  map_id: map_id,
                  point_id: cell_obj[:point],
                  level_no: level_no,
                  clock_no: clock_no,
                  rank: rank,
                  date: Date.new(migrate_time.year, migrate_time.month, migrate_time.day),
                  count: cnt['count'].to_i,
                  hq_count: cnt['hqCount'],
                  origin_count: cnt['originCount'],
                  enemy_fleet: fleet.take(6),
                  enemy_formation: fleet.last)
              end
            end
            puts "#{migrate_time}-#{map_id}-#{cell_obj[:point]}-#{level_no}-#{rank}"
        end
      end
    end
  end

  migrate_time += 3600
  migrate_state.migrate_time = migrate_time
  migrate_state.save
end

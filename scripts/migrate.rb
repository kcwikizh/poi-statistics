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
            count: 1,
            hqCount: {}
          }

          val.hqCount[this.teitokuLv] = 1;

          emit(this.enemyShips.join('/') + '/' + this.enemyFormation, val);
        }
      }

      reduce_func = %Q{
        function(key, values) {
          var reduced = {
            count: 0,
            hqCount: {}
          };

          values.forEach(function(value) {
            reduced.count += value.count;

            for(var lv in value.hqCount) {
              reduced.hqCount[lv] = reduced.hqCount[lv] || 0;
              reduced.hqCount[lv] += value.hqCount[lv];
            }
          });

          return reduced;
        }
      }

      (0..3).to_a.each do |level_no|
        next if map_id < 200 && level_no > 0
        next if map_id >= 200 && level_no == 0

        ['S', 'A', 'B', 'C', 'D', 'E'].each do |rank|
          [(1..467).to_a, -1].flatten.each do |ship_id|
            DropShipRecord.where(
              :id.gte             => BSON::ObjectId.from_time(migrate_time),
              :id.lt              => BSON::ObjectId.from_time(migrate_time + 3600),
              :mapId              => map_id,
              :quest              => map_obj[:name],
              :cellId.in          => cell_obj[:index],
              :enemy              => cell_obj[:name],
              :mapLv              => level_no,
              :rank               => rank,
              :shipId             => ship_id,
              :origin             => /Reporter/)
              .map_reduce(map_func, reduce_func)
              .out(inline: 1).each do |query|
                fleet = query['_id'].split('/').map(&:to_i)
                DropShipStatistic.create(
                  ship_id: ship_id,
                  map_id: map_id,
                  point_id: cell_obj[:point],
                  level_no: level_no,
                  clock_no: clock_no,
                  rank: rank,
                  date: Date.new(migrate_time.year, migrate_time.month, migrate_time.day),
                  count: query['value']['count'].to_i,
                  hq_count: query['value']['hqCount'],
                  enemy_fleet: fleet.take(6),
                  enemy_formation: fleet.last)
            end

            puts "#{migrate_time}-#{map_id}-#{level_no}-#{rank}-#{ship_id}"
          end
        end
      end
    end
  end

  migrate_time += 3600
  migrate_state.migrate_time = migrate_time
  migrate_state.save
end

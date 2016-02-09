require 'psych'
require 'mongoid'
require 'pathname'
require 'base64'
require 'parallel'

path = Pathname.new(File.dirname(__FILE__)).realpath.parent

Mongoid.load!("#{path}/config/mongoid.yml", :production)
Dir["#{path}/models/*.rb"].each { |file| load file }
Dir["#{path}/helpers/*.rb"].each { |file| load file }

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
  from: Time.new(first_time.year, first_time.month, first_time.day, first_time.hour, first_time.min),
  to: Time.new(last_time.year, last_time.month, last_time.day, last_time.hour, first_time.min) - 60
}

migrate_time = migrate_range[:from]
until migrate_time == migrate_range[:to]
  hour_no = migrate_time.hour
  minute_no = migrate_time.min

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

  pool = Sinatra::DropQueryHelper.get_default_pool(migrate_time)
  pool[:map].each do |map_id|
    KanColleConstant.map[map_id][:cells].each do |cell_obj|
      cell_obj[:index].each do |cell_id|
        ['S', 'A', 'B', 'C', 'D', 'E'].each do |rank|
          DropShipRecord.where(
            :id.gte     => BSON::ObjectId.from_time(migrate_time),
            :id.lt      => BSON::ObjectId.from_time(migrate_time + 60),
            :mapId      => map_id,
            :quest      => KanColleConstant.map[map_id][:name],
            :cellId     => cell_id,
            :enemy      => cell_obj[:name],
            :mapLv      => 0,
            :rank       => rank,
            :origin     => /^(?!KCV)/)
            .map_reduce(map_func, reduce_func)
            .out(inline: 1).each do |query|
              Parallel.each(query['value']['enemy'], :in_threads => 4) do |enemy|
                fleet = enemy[0].split('/').map(&:to_i)
                stat = DropShipStatistic.find_or_create_by(
                  name: pool[:name],
                  ship_id: query['_id'].to_i,
                  map_id: map_id,
                  cell_id: cell_id,
                  point_id: cell_obj[:point],
                  level_no: 0,
                  hour_no: hour_no,
                  minute_no: minute_no,
                  rank: rank,
                  enemy_fleet: fleet.take(6),
                  enemy_formation: fleet.last)
                stat.from_time = migrate_time if stat.from_time.nil?
                stat.to_time = migrate_time
                stat.count += enemy[1]['count'].to_i
                enemy[1]['hqCount'].each do |k, v|
                  stat.hq_count[k] ||= 0
                  stat.hq_count[k] += v.to_i
                end
                enemy[1]['originCount'].each do |k, v|
                  stat.origin_count[Base64.encode64(k)] ||= 0
                  stat.origin_count[Base64.encode64(k)] += v.to_i
                end
                stat.save
              end
            end
        end
      end
      puts "#{migrate_time}-#{map_id}-#{cell_obj[:point]}"
    end
  end

  # event
  pool = Sinatra::DropQueryHelper.get_event_pool(migrate_time)
  pool[:map].each do |map_id|
    KanColleConstant.map[map_id][:cells].each do |cell_obj|
      cell_obj[:index].each do |cell_id|
        ['S', 'A', 'B', 'C', 'D', 'E'].each do |rank|
          (3..0).to_a.each do |level_no|
            next if map_id > 200 && level_no == 0
            next if map_id < 200 && level_no > 0

            DropShipRecord.where(
              :id.gte     => BSON::ObjectId.from_time(migrate_time),
              :id.lt      => BSON::ObjectId.from_time(migrate_time + 60),
              :mapId      => map_id,
              :quest      => KanColleConstant.map[map_id][:name],
              :cellId     => cell_id,
              :enemy      => cell_obj[:name],
              :mapLv      => level_no,
              :rank       => rank,
              :origin     => /^(?!KCV)/)
              .map_reduce(map_func, reduce_func)
              .out(inline: 1).each do |query|
                Parallel.each(query['value']['enemy'], :in_threads => 4) do |enemy|
                  fleet = enemy[0].split('/').map(&:to_i)
                  stat = DropShipStatistic.find_or_create_by(
                    name: pool[:name],
                    ship_id: query['_id'].to_i,
                    map_id: map_id,
                    cell_id: cell_id,
                    point_id: cell_obj[:point],
                    level_no: level_no,
                    hour_no: hour_no,
                    minute_no: minute_no,
                    rank: rank,
                    enemy_fleet: fleet.take(6),
                    enemy_formation: fleet.last)
                  stat.from_time = migrate_time if stat.from_time.nil?
                  stat.to_time = migrate_time
                  stat.count += enemy[1]['count'].to_i
                  enemy[1]['hqCount'].each do |k, v|
                    stat.hq_count[k] ||= 0
                    stat.hq_count[k] += v.to_i
                  end
                  enemy[1]['originCount'].each do |k, v|
                    stat.origin_count[Base64.encode64(k)] ||= 0
                    stat.origin_count[Base64.encode64(k)] += v.to_i
                  end
                  stat.save
                end
              end
          end
        end
      end
      puts "#{migrate_time}-#{map_id}-#{cell_obj[:point]}"
    end
  end

  migrate_time += 60
  migrate_state.migrate_time = migrate_time
  migrate_state.save
end

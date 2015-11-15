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
  to: Time.new(last_time.year, last_time.month, last_time.day, last_time.hour - 1)
}

migrate_time = migrate_range[:from]
until migrate_time == migrate_range[:to]
  clock_no = migrate_time.hour
  KanColleConstant.map.each do |map_id, map_obj|
    next if map_id > 11
    map_obj[:cells].each do |cell_obj|
      map_func = %Q{
        function() {
          val = {
            s: 0,
            a: 0,
            b: 0,
            c: 0,
            d: 0,
            e: 0,
            total: 1,
            hqLv: [this.teitokuLv, this.teitokuLv],
            enemy: {}
          }

          switch(this.rank) {
            case 'S':
              val.s = 1;
              break;
            case 'A':
              val.a = 1;
              break;
            case 'B':
              val.b = 1;
              break;
            case 'C':
              val.c = 1;
              break;
            case 'D':
              val.d = 1;
              break;
            case 'E':
              val.e = 1;
              break;
          }

          var enemy = this.enemyShips.join('/') + '/' + this.enemyFormation;
          val.enemy[enemy] = {
            count: 1,
            hqLv: [this.teitokuLv, this.teitokuLv]
          };

          emit(this.shipId, val);
        }
      }

      reduce_func = %Q{
        function(key, values) {
          var reduced = {
            s: 0,
            a: 0,
            b: 0,
            c: 0,
            d: 0,
            e: 0,
            total: 0,
            hqLv: [999, 0],
            enemy: {}
          };

          values.forEach(function(value) {
            reduced.s += value.s;
            reduced.a += value.a;
            reduced.b += value.b;
            reduced.c += value.c;
            reduced.d += value.d;
            reduced.e += value.e;
            reduced.total += value.total;

            if (value.hqLv[0] < reduced.hqLv[0]) {
              reduced.hqLv[0] = value.hqLv[0];
            }
            if (value.hqLv[1] > reduced.hqLv[1]) {
              reduced.hqLv[1] = value.hqLv[1];
            }

            for(var e in value.enemy) {
              reduced.enemy[e] = reduced.enemy[e] || {
                count: 0,
                hqLv: [999, 0]
              };
              reduced.enemy[e].count += value.enemy[e].count;
              if (value.enemy[e].hqLv[0] < reduced.enemy[e].hqLv[0]) {
                reduced.enemy[e].hqLv[0] = value.enemy[e].hqLv[0];
              }
              if (value.enemy[e].hqLv[1] > reduced.enemy[e].hqLv[1]) {
                reduced.enemy[e].hqLv[1] = value.enemy[e].hqLv[1];
              }
            }
          });

          return reduced;
        }
      }

      (0..3).to_a.each do |level_no|
        DropShipRecord.where(
          :id.gte    => BSON::ObjectId.from_time(migrate_time),
          :id.lt     => BSON::ObjectId.from_time(migrate_time + 3600),
          :mapId     => map_id,
          :quest     => map_obj[:name],
          :cellId.in => cell_obj[:index],
          :enemy     => cell_obj[:name],
          :mapLv     => level_no)
          .map_reduce(map_func, reduce_func)
          .out(inline: 1).each do |query|
            drop_stat = DropShipStatistic.find_or_initialize_by(
              ship_id: query['_id'].to_i,
              map_id: map_id,
              point_id: cell_obj[:point],
              level_no: level_no,
              clock_no: clock_no)
            drop_stat.count += query['value']['total'].to_i
            drop_stat.s_count += query['value']['s'].to_i
            drop_stat.a_count += query['value']['a'].to_i
            drop_stat.b_count += query['value']['b'].to_i
            drop_stat.c_count += query['value']['c'].to_i
            drop_stat.d_count += query['value']['d'].to_i
            drop_stat.e_count += query['value']['e'].to_i
            hqLv = query['value']['hqLv'].map(&:to_i)
            drop_stat.min_hq_lv = hqLv[0] if hqLv[0] < drop_stat.min_hq_lv
            drop_stat.max_hq_lv = hqLv[1] if hqLv[1] > drop_stat.max_hq_lv

            query['value']['enemy'].each do |key, value|
              fleet = key.split('/').map(&:to_i)
              enemy_stat = EnemyFleetStatistic.find_or_initialize_by(
                map_id: map_id,
                point_id: cell_obj[:point],
                level_no: level_no,
                ship_id_list: fleet.take(6),
                formation: fleet.last)
              enemy_stat.count += value['count'].to_i
              hqLv = value['hqLv'].map(&:to_i)
              enemy_stat.min_hq_lv = hqLv[0] if hqLv[0] < enemy_stat.min_hq_lv
              enemy_stat.max_hq_lv = hqLv[1] if hqLv[1] > enemy_stat.max_hq_lv

              enemy_stat.save
              drop_stat.enemy_fleets.push(enemy_stat.id) unless drop_stat.enemy_fleets.include?(enemy_stat.id)
            end

            drop_stat.save
        end
      end
    end
  end

  migrate_time += 3600
  migrate_state.migrate_time = migrate_time
  migrate_state.save
end

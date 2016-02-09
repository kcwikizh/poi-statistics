require 'mongoid'
require 'pathname'

path = Pathname.new(File.dirname(__FILE__)).realpath.parent

Mongoid.load!("#{path}/config/mongoid.yml", :production)
Dir["#{path}/models/*.rb"].each { |file| load file }

require '../helpers/drop_query_helper'

def staticify_drop_map(map_id, drop_doc_name)
  levels = KanColleConstant.area[map_id / 10][:event] ? [3, 2, 1] : [0]
  levels.each do |level_no|
    KanColleConstant.map[map_id][:cells].each do |cell|
      query_result = {}

      map_func = %Q{
        function() {
          var val = {
            hqLv: [999, 0],
            enemy: {},
            count: this.count
            };

          Object.keys(this.hq_count).forEach(function(elem) {
            var n = parseInt(elem);
            if (val.hqLv[0] > n) {
              val.hqLv[0] = n;
            }
            if (val.hqLv[1] < n) {
              val.hqLv[1] = n;
            }
          });

          var enemy = this.enemy_fleet.join('/') + '/' + this.enemy_formation;
          val.enemy[enemy] = this.count;

          emit(this.ship_id, val);
        }
      }

      reduce_func = %Q{
        function(key, values) {
          var reduced = {
            hqLv: [999, 0],
            enemy: {},
            count: 0
          }

          values.forEach(function(elem) {
            if (reduced.hqLv[0] > elem.hqLv[0]) {
              reduced.hqLv[0] = elem.hqLv[0];
            }
            if (reduced.hqLv[1] < elem.hqLv[1]) {
              reduced.hqLv[1] = elem.hqLv[1];
            }

            for (var e in elem.enemy) {
              reduced.enemy[e] = reduced.enemy[e] || 0;
              reduced.enemy[e] += elem.enemy[e];
            }

            reduced.count += elem.count;
          });

          return reduced;
        }
      }

      [:S, :A, :B].each do |rank|
        result = {}
        query = DropShipStatistic.where(
          name: drop_doc_name,
          map_id: map_id,
          point_id: cell[:point],
          level_no: level_no,
          rank: rank
        ).map_reduce(map_func, reduce_func).out(inline: 1).each do |q|
          result[q['_id'].to_i] = q['value']
        end

        data_obj = {}
        data_obj['totalCount'] = 0
        data_obj['cacheTime'] = Time.now.strftime("%Y-%m-%d %H:%M:%S")
        data_obj['shipData'] = {}
        data_obj['enemyData'] = {}

        result.each do |id, values|
          data_obj['totalCount'] += values['count'].to_i
          val_obj = {
            'count' => 0,
            'hqLv' => [999, 0],
            'enemy' => {}
          }
          val_obj['count'] = values['count'].to_i
          val_obj['hqLv'] = values['hqLv'].map(&:to_i)
          values['enemy'].each do |k, v|
            idx = k.split('/')
            e = (idx[0..5].map {|i| i == '-1' ? nil : "#{KanColleConstant.ship[i.to_i][:name]}(#{i})"}).compact
            e_name = "#{e.join('/')}(#{KanColleConstant.formation[idx[6].to_i]})"
            val_obj['enemy'][e_name] = v.to_i
            data_obj['enemyData'][e_name] ||= {}
            data_obj['enemyData'][e_name][KanColleConstant.ship[id][:name]] = v.to_i
          end
          data_obj['shipData'][KanColleConstant.ship[id][:name]] = val_obj
        end

        query_result[rank] = data_obj

        cache = StatisticCache.find_or_create_by(
          name: "drop-map-#{map_id}-#{cell[:point]}#{level_no > 0 ? "-#{level_no}" : ""}-#{rank}"
        )
        cache.content = data_obj.to_json
        cache.save
      end

      # rank S/A
      data_obj = {}
      data_obj['totalCount'] = query_result[:S]['totalCount'] + query_result[:A]['totalCount']
      data_obj['cacheTime'] = Time.now.strftime("%Y-%m-%d %H:%M:%S")
      data_obj['shipData'] = {}
      data_obj['enemyData'] = {}
      query_result[:S]['shipData'].each do |ship, value|
        data_obj['shipData'][ship] = {}
        data_obj['shipData'][ship]['count'] = [value['count'], 0]
        data_obj['shipData'][ship]['hqLv'] = value['hqLv']
        data_obj['shipData'][ship]['enemy'] = {}
        value['enemy'].each do |k, v|
          data_obj['shipData'][ship]['enemy'][k] = [v, 0]
        end
      end
      query_result[:A]['shipData'].each do |ship, value|
        data_obj['shipData'][ship] ||= {
          'count' => [0, 0],
          'hqLv' => [999, 0],
          'enemy' => {}
        }
        data_obj['shipData'][ship]['count'][1] = value['count']
        if value['hqLv'][0] < data_obj['shipData'][ship]['hqLv'][0]
          data_obj['shipData'][ship]['hqLv'][0] = value['hqLv'][0]
        end
        if value['hqLv'][1] > data_obj['shipData'][ship]['hqLv'][1]
          data_obj['shipData'][ship]['hqLv'][1] = value['hqLv'][1]
        end
        value['enemy'].each do |k, v|
          data_obj['shipData'][ship]['enemy'][k] ||= [0, 0]
          data_obj['shipData'][ship]['enemy'][k][1] = v
        end
      end
      query_result[:S]['enemyData'].each do |enemy, value|
        data_obj['enemyData'][enemy] = {}
        value.each do |k, v|
          data_obj['enemyData'][enemy][k] = [v, 0]
        end
      end
      query_result[:A]['enemyData'].each do |enemy, value|
        data_obj['enemyData'][enemy] ||= {}
        value.each do |k, v|
          data_obj['enemyData'][enemy][k] ||= [0, 0]
          data_obj['enemyData'][enemy][k][1] = v
        end
      end
      cache = StatisticCache.find_or_create_by(
        name: "drop-map-#{map_id}-#{cell[:point]}#{level_no > 0 ? "-#{level_no}" : ""}-SA"
      )
      cache.content = data_obj.to_json
      cache.save

      # rank S/A/B
      data_obj = {}
      data_obj['totalCount'] = query_result[:S]['totalCount'] + query_result[:A]['totalCount'] + query_result[:B]['totalCount']
      data_obj['cacheTime'] = Time.now.strftime("%Y-%m-%d %H:%M:%S")
      data_obj['shipData'] = {}
      data_obj['enemyData'] = {}
      query_result[:S]['shipData'].each do |ship, value|
        data_obj['shipData'][ship] = {}
        data_obj['shipData'][ship]['count'] = [value['count'], 0, 0]
        data_obj['shipData'][ship]['hqLv'] = value['hqLv']
        data_obj['shipData'][ship]['enemy'] = {}
        value['enemy'].each do |k, v|
          data_obj['shipData'][ship]['enemy'][k] = [v, 0, 0]
        end
      end
      query_result[:A]['shipData'].each do |ship, value|
        data_obj['shipData'][ship] ||= {
          'count' => [0, 0, 0],
          'hqLv' => [999, 0],
          'enemy' => {}
        }
        data_obj['shipData'][ship]['count'][1] = value['count']
        if value['hqLv'][0] < data_obj['shipData'][ship]['hqLv'][0]
          data_obj['shipData'][ship]['hqLv'][0] = value['hqLv'][0]
        end
        if value['hqLv'][1] > data_obj['shipData'][ship]['hqLv'][1]
          data_obj['shipData'][ship]['hqLv'][1] = value['hqLv'][1]
        end
        value['enemy'].each do |k, v|
          data_obj['shipData'][ship]['enemy'][k] ||= [0, 0, 0]
          data_obj['shipData'][ship]['enemy'][k][1] = v
        end
      end
      query_result[:B]['shipData'].each do |ship, value|
        data_obj['shipData'][ship] ||= {
          'count' => [0, 0, 0],
          'hqLv' => [999, 0],
          'enemy' => {}
        }
        data_obj['shipData'][ship]['count'][2] = value['count']
        if value['hqLv'][0] < data_obj['shipData'][ship]['hqLv'][0]
          data_obj['shipData'][ship]['hqLv'][0] = value['hqLv'][0]
        end
        if value['hqLv'][1] > data_obj['shipData'][ship]['hqLv'][1]
          data_obj['shipData'][ship]['hqLv'][1] = value['hqLv'][1]
        end
        value['enemy'].each do |k, v|
          data_obj['shipData'][ship]['enemy'][k] ||= [0, 0, 0]
          data_obj['shipData'][ship]['enemy'][k][2] = v
        end
      end
      query_result[:S]['enemyData'].each do |enemy, value|
        data_obj['enemyData'][enemy] = {}
        value.each do |k, v|
          data_obj['enemyData'][enemy][k] = [v, 0, 0]
        end
      end
      query_result[:A]['enemyData'].each do |enemy, value|
        data_obj['enemyData'][enemy] ||= {}
        value.each do |k, v|
          data_obj['enemyData'][enemy][k] ||= [0, 0, 0]
          data_obj['enemyData'][enemy][k][1] = v
        end
      end
      query_result[:B]['enemyData'].each do |enemy, value|
        data_obj['enemyData'][enemy] ||= {}
        value.each do |k, v|
          data_obj['enemyData'][enemy][k] ||= [0, 0, 0]
          data_obj['enemyData'][enemy][k][2] = v
        end
      end
      cache = StatisticCache.find_or_create_by(
        name: "drop-map-#{map_id}-#{cell[:point]}#{level_no > 0 ? "-#{level_no}" : ""}-SAB"
      )
      cache.content = data_obj.to_json
      cache.save
    end
  end
end

pool = Sinatra::DropQueryHelper.get_default_pool(Time.now)
pool[:map].each do |map_id|
  staticify_drop_map(map_id, pool[:name])
end
pool = Sinatra::DropQueryHelper.get_event_pool(Time.now)
pool[:map].each do |map_id|
  staticify_drop_map(map_id, pool[:name])
end

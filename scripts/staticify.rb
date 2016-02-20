require 'psych'
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

def staticify_wiki_drop(map_id, drop_pool_name)
  response = ''
  KanColleConstant.map[map_id][:cells].sort{|x, y| x[:point] <=> y[:point]}.each do |cell|
    drop_list = DropShipStatistic.where(
      :name => drop_pool_name,
      :map_id => map_id,
      :point_id => cell[:point],
      :ship_id.gt => -1
    ).distinct(:ship_id).group_by do |x|
      case KCConstants.ship_infos[KCConstants.ships[x]][:ship_type]
      when 'dd'
        '驱逐舰'
      when 'cl'
        '轻巡洋舰'
      when 'ca'
        '重巡洋舰'
      when 'bb'
        '战列舰'
      when 'cv'
        '空母类'
      when 'cvl'
        '空母类'
      else
        '其他'
      end
    end

    flag = false
    r = "{{掉落表<br/> |海域点 =#{cell[:point]}<br/> |掉落 ="
    ['驱逐舰', '轻巡洋舰', '重巡洋舰', '战列舰', '空母类', '其他'].each do |type|
      next if !drop_list.include?(type)
      flag = true
      r += "'''#{type}'''："
      r += (drop_list[type].map do |i|
        ship = KanColleConstant.ship[i][:name]
        info = KCConstants.ship_infos[ship]
        if info[:rare]
          "{{稀有舰|#{info[:chinese_name]}}}"
        else
          "[[#{info[:chinese_name]}]]"
        end
      end).join('、')
      r += "&lt;br/&gt;"
    end
    r += "<br/>}}<br/>"

    response += r if flag
  end

  cache = StatisticCache.find_or_create_by(
    name: "wiki-drop-#{map_id}"
  )
  cache.content = response
  cache.save
end

def staticify_wiki_enemy(map_id, drop_pool_name)
  result = ''
  map_func = %Q{
    function() {
      emit(this.enemy_fleet.join('/') + '/' + this.enemy_formation, 1);
    }
  }
  reduce_func = %Q{
    function(key, values) {
      var reduced = 0;

      values.forEach(function(value) {
        reduced += value;
      });

      return reduced;
    }
  }
  levels = []
  if map_id > 200
    levels = [3, 2, 1]
  else
    levels = [0]
  end

  levels.each do |i|
    result += case i
      when 3
        "甲：<br/>"
      when 2
        "乙：<br/>"
      when 1
        "丙：<br/>"
      when 0
        ""
    end
    KanColleConstant.map[map_id][:cells].sort{|x, y| x[:point] <=> y[:point]}.each do |cell|
      count = 0
      result += %Q({{敌方配置表<br/>   |海域点       =#{cell[:point]}<br/>   |海域点原名   =#{cell[:name]}<br/>   |海域点译名   =<br/>)
      sum = DropShipStatistic.where(
        :map_id => map_id,
        :point_id => cell[:point],
        :level_no => i
      ).sum(:count)
      DropShipStatistic.where(
        :map_id => map_id,
        :point_id => cell[:point],
        :level_no => i
      ).map_reduce(map_func, reduce_func).out(inline: 1).each do |q|
        if (sum > 1000 && q['value'].to_f / sum > 0.005) || sum <= 1000
          data = q['_id'].split('/').map(&:to_i)
          result += "   |阵型#{count == 0 ? " " : "#{count}"}        =#{KCConstants.formation[data[-1]]}<br/>"
          result += "   |敌方#{count == 0 ? " " : "#{count}"}        ="
          data.take(6).each do |d|
            next if d == -1
            result += "{{深海横幅|#{d}}}"
          end
          result += "<br/>"
          count += 1
        end
      end
      result += "}}<br/>"
    end
    result += "<br/>"
  end

  cache = StatisticCache.find_or_create_by(
    name: "wiki-enemy-#{map_id}"
  )
  cache.content = result
  cache.save
end

pool = Sinatra::DropQueryHelper.get_default_pool(Time.now)
pool[:map].each do |map_id|
  staticify_drop_map(map_id, pool[:name])
  puts "drop-map-#{map_id}"
  staticify_wiki_drop(map_id, pool[:name])
  puts "wiki-drop-#{map_id}"
  staticify_wiki_enemy(map_id, pool[:name])
  puts "wiki-enemy-#{map_id}"
end
pool = Sinatra::DropQueryHelper.get_event_pool(Time.now)
pool[:map].each do |map_id|
  staticify_drop_map(map_id, pool[:name])
  puts "#{Time.now}\tdrop-map-#{map_id}"
  staticify_wiki_drop(map_id, pool[:name])
  puts "#{Time.now}\twiki-drop-#{map_id}"
  staticify_wiki_enemy(map_id, pool[:name])
  puts "#{Time.now}\twiki-enemy-#{map_id}"
end

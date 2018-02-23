require 'json'
require 'set'
require_relative '../app'

$common_maps = [(11..16).to_a, (21..25).to_a, (31..35).to_a, (41..45).to_a, (51..55).to_a, (61..65).to_a].flatten
$event_maps = [(411..417).to_a].flatten

def staticify_drop_map(map_id)
  levels = map_id > 100 ? [4, 3, 2, 1] : [0]
  table = map_id > 100 ? DropRecordWinter2018 : DropRecord
  table_name = map_id > 100 ? "drop_records_winter2018" : "drop_records"
  levels.each do |level_no|
    KanColleConstant.map[map_id][:cells].each do |cell|
      query_result = {}
      [:S, :A, :B].each do |rank|
        json_obj = {
          totalCount: 0,
          generateTime: Time.now.strftime("%Y-%m-%d %H:%M:%S"),
          data: {}
        }
        
        enemy_total_count = (table.find_by_sql ["SELECT enemy, SUM(count) AS count FROM #{table_name} WHERE map = ? AND cell = ANY(ARRAY[?]) AND level = ? AND rank = ? GROUP BY enemy", map_id, cell[:index], level_no, rank]).reduce({}) {|h, i| h[i.enemy] = i.count; h}
        json_obj[:totalCount] = enemy_total_count.reduce(0) {|sum, i| sum += i[1]}
        enemy_total_count.each do |k, v|
          if v.to_f / json_obj[:totalCount] < 0.01
            enemy_total_count.delete(k)
            json_obj[:totalCount] -= v
          end
        end

        table.where(
          map: map_id,
          cell: cell[:index],
          level: level_no,
          rank: rank
        ).select(:ship).distinct.map(&:ship).each do |ship_id|
          data_obj = {
            enemy: {},
            hqLv: [],
            rate: 0,
            totalCount: 0
          }
          enemy_count = table.find_by_sql ["SELECT enemy, SUM(count) AS count FROM #{table_name} WHERE map = ? AND cell = ANY(ARRAY[?]) AND level = ? AND rank = ? AND ship = ? GROUP BY enemy", map_id, cell[:index], level_no, rank, ship_id]
          enemy_count.each do |q|
            next if enemy_total_count[q.enemy].nil?
            idx = q.enemy.split(',')
            e = (idx[0..-2].map {|i| i == '-1' ? nil : "#{ConstData.ship[i.to_i]["name"]}(#{i})"}).compact
            e_name = "#{e.join('/')}(#{KanColleConstant.formation[idx[-1].to_i]})"
            data_obj[:enemy][e_name] = {
              count: q.count,
              rate: (q.count * 100.0 / enemy_total_count[q.enemy]).round(3)
            }
          end
          hq_lv = (table.find_by_sql ["SELECT min(hq_lv), max(hq_lv) FROM (SELECT DISTINCT CAST(json_object_keys(hq_lv) AS INTEGER) AS hq_lv FROM #{table_name} WHERE map = ? AND cell = ANY(ARRAY[?]) AND level = ? AND rank = ? AND ship = ?) AS hq", map_id, cell[:index], level_no, rank, ship_id]).first
          data_obj[:hqLv] = [hq_lv.min, hq_lv.max]
          data_obj[:totalCount] = data_obj[:enemy].reduce(0) {|sum, i| sum += i[1][:count]}
          data_obj[:rate] = (data_obj[:totalCount] * 100.0 / json_obj[:totalCount]).round(3)

          json_obj[:data][ConstData.ship[ship_id]["name"]] = data_obj if data_obj[:totalCount] > 0
        end

        Sinatra::KVDataHelper.set_kv_data("drop_map_#{map_id}_#{cell[:point]}#{level_no > 0 ? "-#{level_no}" : ""}-#{rank}", json_obj.to_json)
        
        query_result[rank] = json_obj
        query_result[rank][:enemyCount] = enemy_total_count
      end

      # rank S/A
      json_obj = {
        totalCount: query_result[:S][:totalCount] + query_result[:A][:totalCount],
        generateTime: Time.now.strftime("%Y-%m-%d %H:%M:%S"),
        data: {} 
      }

      enemy_total_count = query_result[:S][:enemyCount].merge(query_result[:A][:enemyCount]) {|k, v1, v2| v1 + v2}
      enemy_total_count2 = {}
      enemy_total_count.each do |k, v|
        idx = k.split(',')
        e = (idx[0..-2].map {|i| i == '-1' ? nil : "#{ConstData.ship[i.to_i]["name"]}(#{i})"}).compact
        e_name = "#{e.join('/')}(#{KanColleConstant.formation[idx[-1].to_i]})"
        enemy_total_count2[e_name] = v
      end

      query_result[:S][:data].each do |ship, value|
        json_obj[:data][ship] = {
          rankCount: [value[:totalCount], 0],
          totalCount: value[:totalCount],
          hqLv: value[:hqLv],
          rate: (value[:totalCount] * 100.0 / json_obj[:totalCount]).round(3),
          enemy: {}
        }
        value[:enemy].each do |k, v|
          json_obj[:data][ship][:enemy][k] = {
            count: [v[:count], 0],
            rate: (v[:count] * 100.0 / enemy_total_count2[k]).round(3)
          }
        end
      end

      query_result[:A][:data].each do |ship, value|
        data_obj = json_obj[:data][ship] || {
          rankCount: [0, 0],
          totalCount: 0,
          hqLv: value[:hqLv],
          rate: 0,
          enemy: {}
        }
        data_obj[:rankCount][1] = value[:totalCount]
        data_obj[:totalCount] += value[:totalCount]
        data_obj[:rate] = (data_obj[:totalCount] * 100.0 / json_obj[:totalCount]).round(3)

        if value[:hqLv][0] < data_obj[:hqLv][0]
          data_obj[:hqLv][0] = value[:hqLv][0]
        end
        if value[:hqLv][1] > data_obj[:hqLv][1]
          data_obj[:hqLv][1] = value[:hqLv][1]
        end
        value[:enemy].each do |k, v|
          data_obj[:enemy][k] ||= {
            count: [0, 0],
            rate: 0
          }
          data_obj[:enemy][k][:count][1] = v[:count]
          data_obj[:enemy][k][:rate] = (data_obj[:enemy][k][:count].reduce(&:+) * 100.0 / enemy_total_count2[k]).round(3)
        end

        json_obj[:data][ship] = data_obj
      end

      Sinatra::KVDataHelper.set_kv_data("drop_map_#{map_id}_#{cell[:point]}#{level_no > 0 ? "-#{level_no}" : ""}-SA", json_obj.to_json)

      # rank S/A/B
      json_obj = {
        totalCount: query_result[:S][:totalCount] + query_result[:A][:totalCount] + query_result[:B][:totalCount],
        generateTime: Time.now.strftime("%Y-%m-%d %H:%M:%S"),
        data: {} 
      }

      enemy_total_count = query_result[:S][:enemyCount].merge(query_result[:A][:enemyCount]) {|k, v1, v2| v1 + v2}
      enemy_total_count = enemy_total_count.merge(query_result[:B][:enemyCount]) {|k, v1, v2| v1 + v2}
      enemy_total_count2 = {}
      enemy_total_count.each do |k, v|
        idx = k.split(',')
        e = (idx[0..-2].map {|i| i == '-1' ? nil : "#{ConstData.ship[i.to_i]["name"]}(#{i})"}).compact
        e_name = "#{e.join('/')}(#{KanColleConstant.formation[idx[-1].to_i]})"
        enemy_total_count2[e_name] = v
      end

      query_result[:S][:data].each do |ship, value|
        json_obj[:data][ship] = {
          rankCount: [value[:totalCount], 0, 0],
          totalCount: value[:totalCount],
          hqLv: value[:hqLv],
          rate: (value[:totalCount] * 100.0 / json_obj[:totalCount]).round(3),
          enemy: {}
        }
        value[:enemy].each do |k, v|
          json_obj[:data][ship][:enemy][k] = {
            count: [v[:count], 0, 0],
            rate: (v[:count] * 100.0 / enemy_total_count2[k]).round(3)
          }
        end
      end

      query_result[:A][:data].each do |ship, value|
        data_obj = json_obj[:data][ship] || {
          rankCount: [0, 0, 0],
          totalCount: 0,
          hqLv: value[:hqLv],
          rate: 0,
          enemy: {}
        }
        data_obj[:rankCount][1] = value[:totalCount]
        data_obj[:totalCount] += value[:totalCount]
        data_obj[:rate] = (data_obj[:totalCount] * 100.0 / json_obj[:totalCount]).round(3)

        if value[:hqLv][0] < data_obj[:hqLv][0]
          data_obj[:hqLv][0] = value[:hqLv][0]
        end
        if value[:hqLv][1] > data_obj[:hqLv][1]
          data_obj[:hqLv][1] = value[:hqLv][1]
        end
        value[:enemy].each do |k, v|
          data_obj[:enemy][k] ||= {
            count: [0, 0, 0],
            rate: 0
          }
          data_obj[:enemy][k][:count][1] = v[:count]
          data_obj[:enemy][k][:rate] = (data_obj[:enemy][k][:count].reduce(&:+) * 100.0 / enemy_total_count2[k]).round(3)
        end

        json_obj[:data][ship] = data_obj
      end

      query_result[:B][:data].each do |ship, value|
        data_obj = json_obj[:data][ship] || {
          rankCount: [0, 0, 0],
          totalCount: 0,
          hqLv: value[:hqLv],
          rate: 0,
          enemy: {}
        }
        data_obj[:rankCount][2] = value[:totalCount]
        data_obj[:totalCount] += value[:totalCount]
        data_obj[:rate] = (data_obj[:totalCount] * 100.0 / json_obj[:totalCount]).round(3)

        if value[:hqLv][0] < data_obj[:hqLv][0]
          data_obj[:hqLv][0] = value[:hqLv][0]
        end
        if value[:hqLv][1] > data_obj[:hqLv][1]
          data_obj[:hqLv][1] = value[:hqLv][1]
        end
        value[:enemy].each do |k, v|
          data_obj[:enemy][k] ||= {
            count: [0, 0, 0],
            rate: 0
          }
          data_obj[:enemy][k][:count][2] = v[:count]
          data_obj[:enemy][k][:rate] = (data_obj[:enemy][k][:count].reduce(&:+) * 100.0 / enemy_total_count2[k]).round(3)
        end

        json_obj[:data][ship] = data_obj
      end

      Sinatra::KVDataHelper.set_kv_data("drop_map_#{map_id}_#{cell[:point]}#{level_no > 0 ? "-#{level_no}" : ""}-SAB", json_obj.to_json)
    end
  end
end

def staticify_drop_ship()
  table = [DropRecord, DropRecordWinter2018]
  table_name = ["drop_records", "drop_records_winter2018"]

  ['S', 'A', 'B', 'SA', 'SAB'].each do |rank|
    drop_map_data = {}
    [$common_maps, $event_maps].flatten.each do |map|
      levels = map > 100 ? [4, 3, 2, 1] : [0]
      levels.each do |level|
        KanColleConstant.map[map][:cells].each do |cell|
          drop_map_data["#{map / 10}-#{map % 10}-#{cell[:point]}#{cell[:boss] ? "(Boss)" : ""}#{level == 0 ? "" : (level == 4 ? "-甲" : (level == 3 ? "-乙" : (level == 2 ? "-丙" : "-丁")))}"] = JSON.parse Sinatra::KVDataHelper.get_kv_data("drop_map_#{map}_#{cell[:point]}#{level > 0 ? "-#{level}" : ""}-#{rank}")
        end
      end
    end

    ship_set = Set.new
    drop_map_data.each do |_, drop_data|
      drop_data["data"].each do |key, _|
        ship_set.add key
      end
    end
    ship_set.delete "(无)"
    Sinatra::KVDataHelper.set_kv_data("drop_shiplist", ship_set.to_json)

    ship_set.each do |ship|
      json_obj = {
        totalCount: 0,
        generateTime: Time.now.strftime("%Y-%m-%d %H:%M:%S"),
        data: {}
      }

      drop_map_data.each do |map_name, drop_data|
        next if drop_data["data"][ship].nil?

        json_obj[:totalCount] += drop_data["data"][ship]["totalCount"]

        if rank.length == 1
          json_obj[:data][map_name] ||= {
            hqLv: drop_data["data"][ship]["hqLv"],
            totalCount: drop_data["data"][ship]["totalCount"],
            rate: drop_data["data"][ship]["rate"]
          }
        else
          json_obj[:data][map_name] ||= {
            hqLv: drop_data["data"][ship]["hqLv"],
            totalCount: drop_data["data"][ship]["totalCount"],
            rankCount: drop_data["data"][ship]["rankCount"],
            rate: drop_data["data"][ship]["rate"]
          }
        end
      end

      ship_id = ConstData.ship[ship]["id"]
      Sinatra::KVDataHelper.set_kv_data("drop_ship_#{ship_id}-#{rank}", json_obj.to_json)
    end
  end
end

[$common_maps, $event_maps].flatten.each do |map|
  staticify_drop_map(map)
end
staticify_drop_ship()

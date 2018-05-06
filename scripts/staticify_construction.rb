require_relative '../app'
require 'json'

items = []
recipeTotalCount = {}
secretary_rules = [
  {target: 171, secretary: [128, 174, 175, 176, 177, 179, 180, 310, 311, 400]},
  {target: 174, secretary: [128, 175, 180, 311, 400]},
  {target: 175, secretary: [128, 174, 179, 310, 400]},
  {target: 433, secretary: [162, 360, 440, 433, 438, 499, 500, 545, 550]},
  {target: 448, secretary: [347, 361, 443, 449]},
]
filterRecipe = {}

ship_list = ConstructionRecord.select(:ship).distinct.map(&:ship).to_a - secretary_rules.map{|i| i[:target]}.to_a

secretary_rules.each do |rule|
  ship_id = rule[:target]
  items.push(ship_id)

  result = {
    totalCount: 0,
    generateTime: Time.now.strftime("%Y-%m-%d %H:%M:%S"),
    data: []
  };
  ConstructionRecord.find_by_sql(%Q{
    SELECT cost, SUM(count)
    FROM construction_records
    WHERE ship = #{ship_id}
    GROUP BY cost
  }).each do |s|
    result[:totalCount] += s.sum

    data = {
      recipe: s.cost,
      count: s.sum,
      usedCount: 0,
      hqLvCount: {},
      secretaryCount: {},
      kdockCount: {},
      rate: 0
    }

    totalCount = 0
    ConstructionRecord.find_by_sql(%Q{
      SELECT secretary
      FROM construction_records
      WHERE cost = Array[#{s.cost.join(', ')}]
    }).each do |r|
      rule[:secretary].each do |secretary|
        if r.secretary.include?(secretary.to_s)
          totalCount += r.secretary[secretary.to_s]
        end
      end
    end
    data[:usedCount] = totalCount
    data[:rate] = (s.sum * 100.0 / data[:usedCount]).round(3)

    ConstructionRecord.find_by_sql(%Q{
      SELECT hq_lv, secretary, kdock
      FROM construction_records
      WHERE ship = #{ship_id} AND cost = Array[#{s.cost.join(', ')}]
    }).each do |r|
      data[:hqLvCount].merge!(r.hq_lv) { |k, v1, v2| (v1 + v2) }
      secretary = Hash[r.secretary.map{|k, v| [ConstData.ship[k.to_i]["name"], v]}]
      data[:secretaryCount].merge!(secretary) { |k, v1, v2| (v1 + v2) }
      kdock = Hash[r.kdock.map{|k, v| [k.to_i + 1, v]}]
      data[:kdockCount].merge!(kdock) { |k, v1, v2| (v1 + v2) }
    end
    
    filterRecipe[s.cost.join('-')] ||= 0
    filterRecipe[s.cost.join('-')] += totalCount

    result[:data].push(data)
  end

  Sinatra::KVDataHelper.set_kv_data("construction_ship_#{ship_id}", result.to_json)
end

ship_list.each do |ship_id|
  items.push(ship_id)

  result = {
    totalCount: 0,
    generateTime: Time.now.strftime("%Y-%m-%d %H:%M:%S"),
    data: []
  };
  ConstructionRecord.find_by_sql(%Q{
    SELECT cost, SUM(count)
    FROM construction_records
    WHERE ship = #{ship_id}
    GROUP BY cost
  }).each do |s|
    result[:totalCount] += s.sum

    data = {
      recipe: s.cost,
      count: s.sum,
      usedCount: 0,
      hqLvCount: {},
      secretaryCount: {},
      kdockCount: {},
      rate: 0
    }

    if recipeTotalCount[s.cost.join('-')].nil?
      recipeTotalCount[s.cost.join('-')] = ConstructionRecord.find_by_sql(%Q{
        SELECT SUM(count)
        FROM construction_records
        WHERE cost = Array[#{s.cost.join(', ')}]
      }).first.sum
      if filterRecipe.include?(s.cost.join(', '))
        recipeTotalCount[s.cost.join('-')] -= filterRecipe[s.cost.join('-')]
      end
    end
    data[:usedCount] = recipeTotalCount[s.cost.join('-')]
    data[:rate] = (s.sum * 100.0 / data[:usedCount]).round(3)

    ConstructionRecord.find_by_sql(%Q{
      SELECT hq_lv, secretary, kdock
      FROM construction_records
      WHERE ship = #{ship_id} AND cost = Array[#{s.cost.join(', ')}]
    }).each do |r|
      data[:hqLvCount].merge!(r.hq_lv) { |k, v1, v2| (v1 + v2) }
      secretary = Hash[r.secretary.map{|k, v| [ConstData.ship[k.to_i]["name"], v]}]
      data[:secretaryCount].merge!(secretary) { |k, v1, v2| (v1 + v2) }
      kdock = Hash[r.kdock.map{|k, v| [k.to_i + 1, v]}]
      data[:kdockCount].merge!(kdock) { |k, v1, v2| (v1 + v2) }
    end

    result[:data].push(data)
  end

  Sinatra::KVDataHelper.set_kv_data("construction_ship_#{ship_id}", result.to_json)
end

Sinatra::KVDataHelper.set_kv_data("construction_shiplist", items.to_json)

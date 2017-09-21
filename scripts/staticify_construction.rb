require_relative '../app'

items = []
recipeTotalCount = {}

ConstructionRecord.select(:ship).distinct.each do |record|
  ship_id = record.ship
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

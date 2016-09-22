require_relative '../app'

items = []
recipeTotalCount = {}

DevelopmentRecord.select(:item).distinct.each do |record|
  item_id = record.item
  items.push(item_id)

  result = {
    totalCount: 0,
    generateTime: Time.now.strftime("%Y-%m-%d %H:%M:%S"),
    data: []
  };
  DevelopmentRecord.find_by_sql(%Q{
    SELECT cost, SUM(count)
    FROM development_records
    WHERE item = #{item_id} AND success = true
    GROUP BY cost
  }).each do |s|
    result[:totalCount] += s.sum

    data = {
      recipe: s.cost,
      count: s.sum,
      usedCount: 0,
      hqLvCount: {},
      secretaryCount: {},
      rate: 0
    }

    if recipeTotalCount[s.cost.join('-')].nil?
      recipeTotalCount[s.cost.join('-')] = DevelopmentRecord.find_by_sql(%Q{
        SELECT SUM(count)
        FROM development_records
        WHERE cost = Array[#{s.cost.join(', ')}]
      }).first.sum
    end
    data[:usedCount] = recipeTotalCount[s.cost.join('-')]
    data[:rate] = (s.sum * 100.0 / data[:usedCount]).round(3)

    DevelopmentRecord.find_by_sql(%Q{
      SELECT hq_lv, secretary
      FROM development_records
      WHERE item = #{item_id} AND cost = Array[#{s.cost.join(', ')}]
    }).each do |r|
      data[:hqLvCount].merge!(r.hq_lv) { |k, v1, v2| (v1 + v2) }
      secretary = Hash[r.secretary.map{|k, v| [ConstData.ship[k.to_i]["name"], v]}]
      data[:secretaryCount].merge!(secretary) { |k, v1, v2| (v1 + v2) }
    end

    result[:data].push(data)
  end

  Sinatra::KVDataHelper.set_kv_data("development_item_#{item_id}", result.to_json)
end

Sinatra::KVDataHelper.set_kv_data("development_itemlist", items.to_json)

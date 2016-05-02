require_relative '../app'

items = []

DevelopmentRecord.select(:item).distinct.each do |record|
  item_id = record.item
  items.push(item_id)

  result = {
    totalCount: 0,
    recipes: []
  };
  DevelopmentRecord.find_by_sql(%Q{
    SELECT cost, success, SUM(count)
    FROM development_records
    WHERE item = #{item_id} AND success = true
    GROUP BY cost, success
  }).each do |s|
    result[:totalCount] += s.sum

    data = {
      recipe: s.cost,
      count: s.sum,
      success: s.success,
      usedCount: 0,
      hqLvCount: {},
      secretaryCount: {}
    }

    data[:usedCount] =
      Sinatra::CacheHelper.cache_get_or_set("sum_#{s.cost.join(', ')}") do DevelopmentRecord.find_by_sql(%Q{
          SELECT SUM(count)
          FROM development_records
          WHERE cost = Array[#{s.cost.join(', ')}]
        }).first.sum
      end

    DevelopmentRecord.find_by_sql(%Q{
      SELECT hq_lv, secretary
      FROM development_records
      WHERE item = #{item_id} AND cost = Array[#{s.cost.join(', ')}]
    }).each do |r|
      data[:hqLvCount].merge!(r.hq_lv) { |k, v1, v2| (v1 + v2) }
      data[:secretaryCount].merge!(r.secretary) { |k, v1, v2| (v1 + v2) }
    end

    result[:recipes].push(data)
  end

  Sinatra::KVDataHelper.set_kv_data("development_item_#{item_id}", result.to_json)
end

Sinatra::CacheHelper.cache_clear
Sinatra::KVDataHelper.set_kv_data("development_items", items.to_json)

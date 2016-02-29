require 'haml'
require 'json'

get '/development/?' do
  haml :'development/index', :locals => {
    :location => 'development',
    :title_append => " # 开发统计"
  }
end

get '/development/item/:item.html' do
  item_id = params[:item].to_i
  
  halt 404 if KCSlotItem[item_id].nil?
  
  haml :'development/item', :locals => {
    :location => 'development',
    :title_append => ' # 开发统计 - #{KCSlotItem[item_id][:name]}',
    :item_id => item_id
  }
end

get '/development/item/:item.json' do
  item_id = params[:item].to_i
  
  halt 404 if KCSlotItem[item_id].nil?
  
  result = {
    totalCount: 0,
    recipes: []
  };
  pool_name = get_development_pool_name(Time.now)
  DevelopmentRecord.find_by_sql(%Q{
    SELECT cost, success, SUM(count)
    FROM development_records
    WHERE name = '#{pool_name}' AND item = #{item_id}
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

    data[:usedCount] = DevelopmentRecord.find_by_sql(%Q{
      SELECT SUM(count)
      FROM development_records
      WHERE name = '#{pool_name}' AND cost = Array[#{s.cost.join(', ')}]
    }).first.sum

    DevelopmentRecord.find_by_sql(%Q{
      SELECT hq_lv, secretary
      FROM development_records
      WHERE name = '#{pool_name}' AND item = #{item_id} AND cost = Array[#{s.cost.join(', ')}]
    }).each do |r|
      data[:hqLvCount].merge!(r.hq_lv) { |k, v1, v2| (v1 + v2) }
      data[:secretaryCount].merge!(r.secretary) { |k, v1, v2| (v1 + v2) }
    end
    
    result[:recipes].push(data)
  end
  
  result.to_json
end

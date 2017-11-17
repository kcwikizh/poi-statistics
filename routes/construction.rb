require 'haml'
require 'json'

get '/construction/?' do
  haml :'construction/index', :locals => {
    :location => 'construction',
    :title_append => " # 建造统计"
  }
end

get '/construction/ship/:ship.?:format?' do
  ship_id = params[:ship].to_i

  halt 404 if ConstData.ship[ship_id].nil?

  params[:format] ||= 'html'
  if params[:format] == 'json'
    content_type :json
    return get_kv_data("construction_ship_#{ship_id}")
  end

  return haml :'construction/ship', :locals => {
    :location => 'construction',
    :ship_id => ship_id,
    :title_append => " # 建造统计 - #{ConstData.ship[ship_id]["name"]}",
  }
end

get '/construction/ship_list' do
  content_type :json
  return get_kv_data("construction_shiplist")
end

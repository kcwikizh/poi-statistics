require 'haml'
require 'json'

get '/development/?' do
  haml :'development/index', :locals => {
    :location => 'development',
    :title_append => " # 开发统计"
  }
end

get '/development/item/:item.?:format?' do
  item_id = params[:item].to_i

  halt 404 if ConstData.slotitem[item_id].nil?

  params[:format] ||= 'html'
  if params[:format] == 'json'
    content_type :json
    return get_kv_data("development_item_#{item_id}")
  end

  haml :'development/item', :locals => {
    :location => 'development',
    :title_append => " # 开发统计 - #{ConstData.slotitem[item_id]["name"]}",
    :item_id => item_id
  }
end

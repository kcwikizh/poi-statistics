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

  get_kv_data("development_item_#{item_id}")
end

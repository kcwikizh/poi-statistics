require 'json'

get '/event-april2018/?' do
  haml :'event-april2018/index', :locals => {
    :location => 'event',
    :title_append => " # 活动统计 - 2018年四月限定",
    :ship165_data => JSON.parse(get_kv_data("event_april2018_drop_ship_165")),
  }
end

require 'json'

get '/event-6th-anniv/?' do
  haml :'event-6th-anniv/index', :locals => {
    :location => 'event',
    :title_append => " # 活动统计 - 6周年期间限定",
    :ship445_data => JSON.parse(get_kv_data("event_6th-anniv_drop_ship_445")),
    :ship574_data => JSON.parse(get_kv_data("event_6th-anniv_drop_ship_574")),
    :ship491_data => JSON.parse(get_kv_data("event_6th-anniv_drop_ship_491")),
    :ship451_data => JSON.parse(get_kv_data("event_6th-anniv_drop_ship_451")),
    :ship162_data => JSON.parse(get_kv_data("event_6th-anniv_drop_ship_162")),
  }
end

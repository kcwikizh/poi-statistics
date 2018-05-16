require 'json'

get '/event-sanma2017/?' do
  haml :'event-sanma2017/index', :locals => {
    :location => 'event',
    :title_append => " # 活动统计 - 2017年秋刀鱼祭典",
    :item68_data => JSON.parse(get_kv_data("event_sanma2017_drop_item_68")),
    :ship517_data => JSON.parse(get_kv_data("event_sanma2017_drop_ship_517")),
    :ship518_data => JSON.parse(get_kv_data("event_sanma2017_drop_ship_518")),
    :ship524_data => JSON.parse(get_kv_data("event_sanma2017_drop_ship_524")),
    :ship525_data => JSON.parse(get_kv_data("event_sanma2017_drop_ship_525")),
  }
end

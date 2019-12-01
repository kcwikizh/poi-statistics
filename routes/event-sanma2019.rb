require 'json'

get '/event-sanma2019/?' do
  haml :'event-sanma2019/index', :locals => {
    :location => 'event',
    :title_append => " # 活动统计 - 2019年秋刀鱼祭典",
    :item68_data => JSON.parse(get_kv_data("event_sanma2019_drop_item_68")),
    :item93_data => JSON.parse(get_kv_data("event_sanma2019_drop_item_93")),
    :ship517_data => JSON.parse(get_kv_data("event_sanma2019_drop_ship_517")),
    :ship518_data => JSON.parse(get_kv_data("event_sanma2019_drop_ship_518")),
    :ship524_data => JSON.parse(get_kv_data("event_sanma2019_drop_ship_524")),
    :ship525_data => JSON.parse(get_kv_data("event_sanma2019_drop_ship_525")),
    :ship531_data => JSON.parse(get_kv_data("event_sanma2019_drop_ship_531")),
    :ship552_data => JSON.parse(get_kv_data("event_sanma2019_drop_ship_552")),
    :ship565_data => JSON.parse(get_kv_data("event_sanma2019_drop_ship_565")),
    :ship584_data => JSON.parse(get_kv_data("event_sanma2019_drop_ship_584")),
    :ship585_data => JSON.parse(get_kv_data("event_sanma2019_drop_ship_585")),
  }
end

require 'json'

get '/event-sanma2018/?' do
  haml :'event-sanma2018/index', :locals => {
    :location => 'event',
    :title_append => " # 活动统计 - 2018年秋刀鱼祭典",
    :item68_data => JSON.parse(get_kv_data("event_sanma2018_drop_item_68")),
    :ship524_data => JSON.parse(get_kv_data("event_sanma2018_drop_ship_524")),
    :ship525_data => JSON.parse(get_kv_data("event_sanma2018_drop_ship_525")),
    :ship565_data => JSON.parse(get_kv_data("event_sanma2018_drop_ship_565")),
  }
end

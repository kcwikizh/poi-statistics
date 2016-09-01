require 'json'

get '/event-summer2016/?' do
  haml :'event-summer2016/index', :locals => {
    :location => 'event',
    :title_append => " # 活动统计",
    :data => JSON.parse(get_kv_data("summer_event_2016_total")),
  }
end

get '/event-summer2016/:mid.html' do
  map_id = params[:mid].to_i

  haml :'event-summer2016/query', :locals => {
    :location => 'event',
    :map_id => map_id,
    :title_append => " # 活动统计 @ E#{map_id % 10}",
    :data => JSON.parse(get_kv_data("summer_event_2016_#{map_id}")),
  }
end

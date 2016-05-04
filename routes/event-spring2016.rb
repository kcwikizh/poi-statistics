require 'json'

get '/event-spring2016/?' do
  haml :'event-spring2016/index', :locals => {
    :location => 'event',
    :title_append => " # 活动统计",
    :data => JSON.parse(get_kv_data("spring_event_2016_total")),
  }
end

get '/event-spring2016/:mid.html' do
  map_id = params[:mid].to_i

  haml :'event-spring2016/query', :locals => {
    :location => 'event',
    :map_id => map_id,
    :title_append => " # 活动统计 @ E#{map_id % 10}",
    :data => JSON.parse(get_kv_data("spring_event_2016_#{map_id}")),
  }
end

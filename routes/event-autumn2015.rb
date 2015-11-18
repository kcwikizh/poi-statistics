get '/event-autumn2015/?' do
  haml :'event-autumn2015/index', :locals => {
    :location => 'event',
    :title_append => " # 活动统计",
  }
end

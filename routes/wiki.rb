get '/wiki/drop/:mid.?:format?' do
  StatisticCache.where(name: "wiki-drop-#{params[:mid]}").first.content
end

get '/wiki/enemy/:mid.?:format?' do
  StatisticCache.where(name: "wiki-enemy-#{params[:mid]}").first.content
end

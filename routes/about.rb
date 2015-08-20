get '/about/?' do
  haml :'about/index', :locals => {
    :location => 'about',
    :title_append => " # 关于",
  }
end

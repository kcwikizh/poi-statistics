get '/settings/?' do
  haml :'settings/index', :locals => {
    :location => 'settings',
    :title_append => " # 设置",
  }
end

require 'haml'
require 'json'

get '/drop/?' do
  haml :'drop/index', :locals => {
    :location => 'drop',
    :title_append => " # 掉落统计"
  }
end

get '/drop/map/:map/?' do
  map_id = params[:map].to_i
  area_id = map_id / 10
  cell = KanColleConstant.map[map_id][:cells].find{|c| c[:boss]}
  point_id = cell.nil? ? KanColleConstant.map[map_id][:cells].last : cell[:point]
  if map_id == 16
    redirect "/drop/map/16/B-SAB.html"
  elsif map_id == 371
    redirect "/drop/map/371/3/I-SAB.html"
  elsif KanColleConstant.area[area_id][:event]
    if area_id > 40
      redirect "/drop/map/#{map_id}/4/#{point_id}-SAB.html"
    else
      redirect "/drop/map/#{map_id}/3/#{point_id}-SAB.html"
    end
  else
    redirect "/drop/map/#{map_id}/#{point_id}-SAB.html"
  end
end

get '/drop/map/:map/:point-:rank.?:format?' do
  map_id = params[:map].to_i
  area_id = map_id / 10
  point_id = params[:point].to_sym
  rank = params[:rank].split('').map(&:to_sym).uniq

  halt 404 if KanColleConstant.area[area_id].nil? ||
    !KanColleConstant.area[area_id][:maps].include?(map_id) ||
    KanColleConstant.area[area_id][:event] ||
    KanColleConstant.map[map_id][:cells].index{|c| c[:point] == point_id}.nil? ||
    rank.any?{|r| ![:S, :A, :B].include?(r)}

  params[:format] ||= 'html'
  if params[:format] == 'json'
    content_type :json
    return get_kv_data("drop_map_#{map_id}_#{point_id}-#{rank.join('')}")
  end

  haml :'drop/map', :locals => {
    :location => 'drop',
    :title_append => " # 掉落统计 - #{KanColleConstant.map[map_id][:name]}(#{point_id})",
    :area_id => area_id,
    :map_id => map_id,
    :point_id => point_id,
    :rank => rank.join('')
  }
end

get '/drop/map/:map/:level/:point-:rank.?:format?' do
  map_id = params[:map].to_i
  area_id = map_id / 10
  point_id = params[:point].to_sym
  level_no = params[:level].to_i
  rank = params[:rank].split('').map(&:to_sym).uniq

  halt 404 if KanColleConstant.area[area_id].nil? ||
    !KanColleConstant.area[area_id][:maps].include?(map_id) ||
    !KanColleConstant.area[area_id][:event] ||
    KanColleConstant.map[map_id][:cells].index{|c| c[:point] == point_id}.nil? ||
    level_no < 1 || map_id < 100 ||
    (map_id < 410 && level_no > 3) || (map_id > 410 && level_no > 4) ||
    rank.any?{|r| ![:S, :A, :B].include?(r)}

  params[:format] ||= 'html'
  if params[:format] == 'json'
    content_type :json
    return get_kv_data("drop_map_#{map_id}_#{point_id}-#{level_no}-#{rank.join('')}")
  end

  haml :'drop/map', :locals => {
    :location => 'drop',
    :title_append => " # 掉落统计 - #{KanColleConstant.map[map_id][:name]}(#{point_id})",
    :area_id => area_id,
    :map_id => map_id,
    :point_id => point_id,
    :level_no => level_no,
    :rank => rank.join('')
  }
end

get '/drop/ship/:ship_id/?' do
  ship_id = params[:ship_id].to_i

  redirect "/drop/ship/#{ship_id}/SAB.html"
end

get '/drop/ship/:ship_id/:rank.?:format?' do
  ship_id = params[:ship_id].to_i
  rank = params[:rank].split('').map(&:to_sym).uniq

  halt 404 if ConstData.ship[ship_id].nil? ||
    rank.any?{|r| ![:S, :A, :B].include?(r)}

  params[:format] ||= 'html'
  if params[:format] == 'json'
    content_type :json
    return get_kv_data("drop_ship_#{ship_id}-#{rank.join('')}")
  end

  haml :'drop/ship', :locals => {
    :location => 'drop',
    :title_append => " # 掉落统计 - #{ConstData.ship[ship_id]["name"]}",
    :ship_id => ship_id,
    :rank => rank.join('')
  }
end

get '/drop/ship_list' do
  content_type :json
  return get_kv_data("drop_shiplist")
end

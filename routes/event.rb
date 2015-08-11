get '/event/:mid.?:format?' do
  map_id = params[:mid].to_i

  result = {
    first: {
      chosen: 0,
      passed: 0,
      hqLvMin: 0,
      hqLvMax: 0,
    },
    second: {
      chosen: 0,
      passed: 0,
      hqLvMin: 0,
      hqLvMax: 0,
    },
    third: {
      chosen: 0,
      passed: 0,
      hqLvMin: 0,
      hqLvMax: 0,
    },
  }

  result[:first][:chosen] = SelectRankRecord.where(:mapareaId => map_id, :rank => 3).count
  result[:first][:passed] = PassEventRecord.where(:mapId => map_id, :mapLv => 3).count
  result[:first][:hqLvMin] = PassEventRecord.where(:mapId => map_id, :mapLv => 3).min(:teitokuLv).to_i
  result[:first][:hqLvMax] = PassEventRecord.where(:mapId => map_id, :mapLv => 3).max(:teitokuLv).to_i

  result[:second][:chosen] = SelectRankRecord.where(:mapareaId => map_id, :rank => 2).count
  result[:second][:passed] = PassEventRecord.where(:mapId => map_id, :mapLv => 2).count
  result[:second][:hqLvMin] = PassEventRecord.where(:mapId => map_id, :mapLv => 2).min(:teitokuLv).to_i
  result[:second][:hqLvMax] = PassEventRecord.where(:mapId => map_id, :mapLv => 2).max(:teitokuLv).to_i

  result[:third][:chosen] = SelectRankRecord.where(:mapareaId => map_id, :rank => 1).count
  result[:third][:passed] = PassEventRecord.where(:mapId => map_id, :mapLv => 1).count
  result[:third][:hqLvMin] = PassEventRecord.where(:mapId => map_id, :mapLv => 1).min(:teitokuLv).to_i
  result[:third][:hqLvMax] = PassEventRecord.where(:mapId => map_id, :mapLv => 1).max(:teitokuLv).to_i

  haml :'event/index', :locals => {
    :location => 'event',
    :map_id => map_id,
    :title_append => " # 活动统计",
    :data => result,
  }
end

get '/event/?' do
  '<script>location.href = location.protocol + "//" + location.host + "/event/311.html";</script>'
end

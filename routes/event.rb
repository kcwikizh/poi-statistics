get '/event/:mid.?:format?' do
  map_id = params[:mid].to_i

  result = {
    first: {
      chosen: 0,
      passed: 0,
      hqLvMin: 0,
      hqLvMax: 0,
      battleTotal: 0,
      battleBoss: 0,
    },
    second: {
      chosen: 0,
      passed: 0,
      hqLvMin: 0,
      hqLvMax: 0,
      battleTotal: 0,
      battleBoss: 0,
    },
    third: {
      chosen: 0,
      passed: 0,
      hqLvMin: 0,
      hqLvMax: 0,
      battleTotal: 0,
      battleBoss: 0,
    },
  }

  result[:first][:chosen] = SelectRankRecord.where(:mapareaId => map_id, :rank => 3).count
  result[:first][:passed] = PassEventRecord.where(:mapId => map_id, :mapLv => 3).count
  result[:first][:hqLvMin] = PassEventRecord.where(:mapId => map_id, :mapLv => 3).min(:teitokuLv).to_i
  result[:first][:hqLvMax] = PassEventRecord.where(:mapId => map_id, :mapLv => 3).max(:teitokuLv).to_i
  case map_id
  when 311
    result[:first][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId => 1).count
    result[:first][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId.in => [8, 10], :rank.in =>['S', 'A']).count
  when 312
    result[:first][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId => 1).count
    result[:first][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId.in => [13, 17], :rank.in =>['S', 'A']).count
  when 313
    result[:first][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId => 3).count
    result[:first][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId.in => [12, 16, 17], :rank.in =>['S', 'A']).count
  when 314
    result[:first][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId.in => [1, 2]).count
    result[:first][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId.in => [13, 18], :rank.in =>['S', 'A']).count
  when 315
    result[:first][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId => 3).count
    result[:first][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId => 14, :rank.in =>['S', 'A']).count
  end

  result[:second][:chosen] = SelectRankRecord.where(:mapareaId => map_id, :rank => 2).count
  result[:second][:passed] = PassEventRecord.where(:mapId => map_id, :mapLv => 2).count
  result[:second][:hqLvMin] = PassEventRecord.where(:mapId => map_id, :mapLv => 2).min(:teitokuLv).to_i
  result[:second][:hqLvMax] = PassEventRecord.where(:mapId => map_id, :mapLv => 2).max(:teitokuLv).to_i
  case map_id
  when 311
    result[:second][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId => 1).count
    result[:second][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId.in => [8, 10], :rank.in =>['S', 'A']).count
  when 312
    result[:second][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId => 1).count
    result[:second][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId.in => [13, 17], :rank.in =>['S', 'A']).count
  when 313
    result[:second][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId => 3).count
    result[:second][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId.in => [12, 16, 17], :rank.in =>['S', 'A']).count
  when 314
    result[:second][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId.in => [1, 2]).count
    result[:second][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId.in => [13, 18], :rank.in =>['S', 'A']).count
  when 315
    result[:second][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId => 3).count
    result[:second][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId => 14, :rank.in =>['S', 'A']).count
  end

  result[:third][:chosen] = SelectRankRecord.where(:mapareaId => map_id, :rank => 1).count
  result[:third][:passed] = PassEventRecord.where(:mapId => map_id, :mapLv => 1).count
  result[:third][:hqLvMin] = PassEventRecord.where(:mapId => map_id, :mapLv => 1).min(:teitokuLv).to_i
  result[:third][:hqLvMax] = PassEventRecord.where(:mapId => map_id, :mapLv => 1).max(:teitokuLv).to_i
  case map_id
  when 311
    result[:third][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId => 1).count
    result[:third][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId.in => [8, 10], :rank.in =>['S', 'A']).count
  when 312
    result[:third][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId => 1).count
    result[:third][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId.in => [13, 17], :rank.in =>['S', 'A']).count
  when 313
    result[:third][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId => 3).count
    result[:third][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId.in => [12, 16, 17], :rank.in =>['S', 'A']).count
  when 314
    result[:third][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId.in => [1, 2]).count
    result[:third][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId.in => [13, 18], :rank.in =>['S', 'A']).count
  when 315
    result[:third][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId => 3).count
    result[:third][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId => 14, :rank.in =>['S', 'A']).count
  end

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

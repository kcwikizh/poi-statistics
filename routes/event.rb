get '/event/?' do
  result = {
    e1: {
      chosen: 0,
      passed: 0,
    },
    e2: {
      chosen: 0,
      passed: 0,
    },
    e3: {
      chosen: 0,
      passed: 0,
    },
    e4: {
      chosen: 0,
      passed: 0,
    },
    e5: {
      chosen: 0,
      passed: 0,
    },
    e6: {
      chosen: 0,
      passed: 0,
    },
    e7: {
      chosen: 0,
      passed: 0,
    },
  }

  result[:e1][:chosen] = SelectRankRecord.where(:mapareaId => 311).count
  result[:e1][:passed] = PassEventRecord.where(:mapId => 311).count
  if result[:e1][:chosen] < result[:e1][:passed]
    result[:e1][:chosen] = result[:e1][:passed]
  end

  result[:e2][:chosen] = SelectRankRecord.where(:mapareaId => 312).count
  result[:e2][:passed] = PassEventRecord.where(:mapId => 312).count
  if result[:e2][:chosen] < result[:e2][:passed]
    result[:e2][:chosen] = result[:e2][:passed]
  end

  result[:e3][:chosen] = SelectRankRecord.where(:mapareaId => 313).count
  result[:e3][:passed] = PassEventRecord.where(:mapId => 313).count
  if result[:e3][:chosen] < result[:e3][:passed]
    result[:e3][:chosen] = result[:e3][:passed]
  end

  result[:e4][:chosen] = SelectRankRecord.where(:mapareaId => 314).count
  result[:e4][:passed] = PassEventRecord.where(:mapId => 314).count
  if result[:e4][:chosen] < result[:e4][:passed]
    result[:e4][:chosen] = result[:e4][:passed]
  end

  result[:e5][:chosen] = SelectRankRecord.where(:mapareaId => 315).count
  result[:e5][:passed] = PassEventRecord.where(:mapId => 315).count
  if result[:e5][:chosen] < result[:e5][:passed]
    result[:e5][:chosen] = result[:e5][:passed]
  end

  result[:e6][:chosen] = SelectRankRecord.where(:mapareaId => 316).count
  result[:e6][:passed] = PassEventRecord.where(:mapId => 316).count
  if result[:e6][:chosen] < result[:e6][:passed]
    result[:e6][:chosen] = result[:e6][:passed]
  end

  result[:e7][:chosen] = SelectRankRecord.where(:mapareaId => 317).count
  result[:e7][:passed] = PassEventRecord.where(:mapId => 317).count
  if result[:e7][:chosen] < result[:e7][:passed]
    result[:e7][:chosen] = result[:e7][:passed]
  end

  haml :'event/index', :locals => {
    :location => 'event',
    :title_append => " # 活动统计",
    :data => result,
  }
end

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
  if result[:first][:chosen] < result[:first][:passed]
    result[:first][:chosen] = result[:first][:passed]
  end
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
  if result[:second][:chosen] < result[:second][:passed]
    result[:second][:chosen] = result[:second][:passed]
  end
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
  if result[:third][:chosen] < result[:third][:passed]
    result[:third][:chosen] = result[:third][:passed]
  end
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

  haml :'event/query', :locals => {
    :location => 'event',
    :map_id => map_id,
    :title_append => " # 活动统计 @ E#{map_id % 10}",
    :data => result,
  }
end

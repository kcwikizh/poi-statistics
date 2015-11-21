get '/event-autumn2015/?' do
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
  }

  result[:e1][:chosen] = SelectRankRecord.where(:mapareaId => 321).count
  result[:e1][:passed] = PassEventRecord.where(:mapId => 321).count
  if result[:e1][:chosen] < result[:e1][:passed]
    result[:e1][:chosen] = result[:e1][:passed]
  end

  result[:e2][:chosen] = SelectRankRecord.where(:mapareaId => 322).count
  result[:e2][:passed] = PassEventRecord.where(:mapId => 322).count
  if result[:e2][:chosen] < result[:e2][:passed]
    result[:e2][:chosen] = result[:e2][:passed]
  end

  result[:e3][:chosen] = SelectRankRecord.where(:mapareaId => 323).count
  result[:e3][:passed] = PassEventRecord.where(:mapId => 323).count
  if result[:e3][:chosen] < result[:e3][:passed]
    result[:e3][:chosen] = result[:e3][:passed]
  end

  result[:e4][:chosen] = SelectRankRecord.where(:mapareaId => 324).count
  result[:e4][:passed] = PassEventRecord.where(:mapId => 324).count
  if result[:e4][:chosen] < result[:e4][:passed]
    result[:e4][:chosen] = result[:e4][:passed]
  end

  result[:e5][:chosen] = SelectRankRecord.where(:mapareaId => 325).count
  result[:e5][:passed] = PassEventRecord.where(:mapId => 325).count
  if result[:e5][:chosen] < result[:e5][:passed]
    result[:e5][:chosen] = result[:e5][:passed]
  end

  haml :'event-autumn2015/index', :locals => {
    :location => 'event',
    :title_append => " # 活动统计",
    :data => result,
  }
end

get '/event-autumn2015/:mid.?:format?' do
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
  when 321
    result[:first][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId.in => [3, 5]).count
    result[:first][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId.in => [10, 14], :rank.in =>['S', 'A']).count
  when 322
    result[:first][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId.in => [2, 3, 4]).count
    result[:first][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId.in => [11, 17], :rank.in =>['S', 'A']).count
  when 323
    result[:first][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId.in => [2, 3]).count
    result[:first][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId => 11, :rank.in =>['S', 'A']).count
  when 324
    result[:first][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId.in => [2, 3, 4]).count
    result[:first][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId => 15, :rank.in =>['S', 'A']).count
  when 325
    result[:first][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3, :cellId.in => [2, 6, 7]).count
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
  when 321
    result[:second][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId.in => [3, 5]).count
    result[:second][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId.in => [10, 14], :rank.in =>['S', 'A']).count
  when 322
    result[:second][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId.in => [2, 3, 4]).count
    result[:second][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId.in => [11, 17], :rank.in =>['S', 'A']).count
  when 323
    result[:second][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId.in => [2, 3]).count
    result[:second][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId => 11, :rank.in =>['S', 'A']).count
  when 324
    result[:second][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId.in => [2, 3, 4]).count
    result[:second][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId => 15, :rank.in =>['S', 'A']).count
  when 325
    result[:second][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 2, :cellId.in => [2, 6, 7]).count
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
  when 321
    result[:third][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId.in => [3, 5]).count
    result[:third][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId.in => [10, 14], :rank.in =>['S', 'A']).count
  when 322
    result[:third][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId.in => [2, 3, 4]).count
    result[:third][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId.in => [11, 17], :rank.in =>['S', 'A']).count
  when 323
    result[:third][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId.in => [2, 3]).count
    result[:third][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId => 11, :rank.in =>['S', 'A']).count
  when 324
    result[:third][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId.in => [2, 3, 4]).count
    result[:third][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId => 15, :rank.in =>['S', 'A']).count
  when 325
    result[:third][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId.in => [2, 6, 7]).count
    result[:third][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 1, :cellId => 14, :rank.in =>['S', 'A']).count
  end

  haml :'event-autumn2015/query', :locals => {
    :location => 'event',
    :map_id => map_id,
    :title_append => " # 活动统计 @ E#{map_id % 10}",
    :data => result,
  }
end

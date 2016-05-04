get '/event-spring2016/?' do
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

  result[:e1][:chosen] = SelectRankRecord.where(:mapareaId => 341).count
  result[:e1][:passed] = PassEventRecord.where(:mapId => 341).count
  if result[:e1][:chosen] < result[:e1][:passed]
    result[:e1][:chosen] = result[:e1][:passed]
  end

  result[:e2][:chosen] = SelectRankRecord.where(:mapareaId => 342).count
  result[:e2][:passed] = PassEventRecord.where(:mapId => 342).count
  if result[:e2][:chosen] < result[:e2][:passed]
    result[:e2][:chosen] = result[:e2][:passed]
  end

  result[:e3][:chosen] = SelectRankRecord.where(:mapareaId => 343).count
  result[:e3][:passed] = PassEventRecord.where(:mapId => 343).count
  if result[:e3][:chosen] < result[:e3][:passed]
    result[:e3][:chosen] = result[:e3][:passed]
  end

  result[:e4][:chosen] = SelectRankRecord.where(:mapareaId => 344).count
  result[:e4][:passed] = PassEventRecord.where(:mapId => 344).count
  if result[:e4][:chosen] < result[:e4][:passed]
    result[:e4][:chosen] = result[:e4][:passed]
  end

  result[:e5][:chosen] = SelectRankRecord.where(:mapareaId => 345).count
  result[:e5][:passed] = PassEventRecord.where(:mapId => 345).count
  if result[:e5][:chosen] < result[:e5][:passed]
    result[:e5][:chosen] = result[:e5][:passed]
  end

  result[:e6][:chosen] = SelectRankRecord.where(:mapareaId => 346).count
  result[:e6][:passed] = PassEventRecord.where(:mapId => 346).count
  if result[:e6][:chosen] < result[:e6][:passed]
    result[:e6][:chosen] = result[:e6][:passed]
  end

  result[:e7][:chosen] = SelectRankRecord.where(:mapareaId => 347).count
  result[:e7][:passed] = PassEventRecord.where(:mapId => 347).count
  if result[:e7][:chosen] < result[:e7][:passed]
    result[:e7][:chosen] = result[:e7][:passed]
  end

  haml :'event-spring2016/index', :locals => {
    :location => 'event',
    :title_append => " # 活动统计",
    :data => result,
  }
end

get '/event-spring2016/:mid.html' do
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

  [:first, :second, :third].each_with_index do |lv, idx|
    result[lv][:chosen] = SelectRankRecord.where(:mapareaId => map_id, :rank => 3 - idx).count
    result[lv][:passed] = PassEventRecord.where(:mapId => map_id, :mapLv => 3 - idx).count
    if result[lv][:chosen] < result[lv][:passed]
      result[lv][:chosen] = result[lv][:passed]
    end
    result[lv][:hqLvMin] = PassEventRecord.where(:mapId => map_id, :mapLv => 3 - idx).min(:teitokuLv).to_i
    result[lv][:hqLvMax] = PassEventRecord.where(:mapId => map_id, :mapLv => 3 - idx).max(:teitokuLv).to_i
    case map_id
    when 341
      result[lv][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId => 2).count
      result[lv][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId => 10, :rank.in =>['S', 'A']).count
    when 342
      result[lv][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [1, 2]).count
      result[lv][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId => 10, :rank.in =>['S', 'A']).count
    when 343
      result[lv][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [1, 4]).count
      result[lv][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId => 11, :rank.in =>['S', 'A']).count
    when 344
      result[lv][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId => 1).count
      result[lv][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [11, 18], :rank.in =>['S', 'A']).count
    when 345
      result[lv][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId => 1).count
      result[lv][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId => 13, :rank.in =>['S', 'A']).count
    when 346
      result[lv][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [1, 4, 5]).count
      result[lv][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [14, 20, 21], :rank.in =>['S', 'A']).count
    when 347
      result[lv][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [1, 2]).count
      result[lv][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [14, 21], :rank.in =>['S', 'A']).count
    end
  end

  haml :'event-spring2016/query', :locals => {
    :location => 'event',
    :map_id => map_id,
    :title_append => " # 活动统计 @ E#{map_id % 10}",
    :data => result,
  }
end

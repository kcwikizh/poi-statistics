get '/event-winter2016/?' do
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
  }

  result[:e1][:chosen] = SelectRankRecord.where(:mapareaId => 331).count
  result[:e1][:passed] = PassEventRecord.where(:mapId => 331).count
  if result[:e1][:chosen] < result[:e1][:passed]
    result[:e1][:chosen] = result[:e1][:passed]
  end

  result[:e2][:chosen] = SelectRankRecord.where(:mapareaId => 332).count
  result[:e2][:passed] = PassEventRecord.where(:mapId => 332).count
  if result[:e2][:chosen] < result[:e2][:passed]
    result[:e2][:chosen] = result[:e2][:passed]
  end

  result[:e3][:chosen] = SelectRankRecord.where(:mapareaId => 333).count
  result[:e3][:passed] = PassEventRecord.where(:mapId => 333).count
  if result[:e3][:chosen] < result[:e3][:passed]
    result[:e3][:chosen] = result[:e3][:passed]
  end

  haml :'event-winter2016/index', :locals => {
    :location => 'event',
    :title_append => " # 活动统计",
    :data => result,
  }
end

get '/event-winter2016/:mid.html' do
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
    when 321
      result[lv][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [1, 2]).count
      result[lv][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId => 10, :rank.in =>['S', 'A']).count
    when 322
      result[lv][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [1, 3]).count
      result[lv][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [15, 21], :rank.in =>['S', 'A']).count
    when 323
      result[lv][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [1, 6, 11, 13]).count
      result[lv][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [19, 20, 23, 24], :rank.in =>['S', 'A']).count
    end
  end

  haml :'event-winter2016/query', :locals => {
    :location => 'event',
    :map_id => map_id,
    :title_append => " # 活动统计 @ E#{map_id % 10}",
    :data => result,
  }
end

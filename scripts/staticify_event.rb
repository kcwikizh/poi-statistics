require_relative '../app'
require 'json'

def event_total
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

  result[:e1][:chosen] = SelectRankRecord.where(:mapareaId => 361).count
  result[:e1][:passed] = PassEventRecord.where(:mapId => 361).count
  if result[:e1][:chosen] < result[:e1][:passed]
    result[:e1][:chosen] = result[:e1][:passed]
  end

  result[:e2][:chosen] = SelectRankRecord.where(:mapareaId => 362).count
  result[:e2][:passed] = PassEventRecord.where(:mapId => 362).count
  if result[:e2][:chosen] < result[:e2][:passed]
    result[:e2][:chosen] = result[:e2][:passed]
  end

  result[:e3][:chosen] = SelectRankRecord.where(:mapareaId => 363).count
  result[:e3][:passed] = PassEventRecord.where(:mapId => 363).count
  if result[:e3][:chosen] < result[:e3][:passed]
    result[:e3][:chosen] = result[:e3][:passed]
  end

  result[:e4][:chosen] = SelectRankRecord.where(:mapareaId => 364).count
  result[:e4][:passed] = PassEventRecord.where(:mapId => 364).count
  if result[:e4][:chosen] < result[:e4][:passed]
    result[:e4][:chosen] = result[:e4][:passed]
  end

  result[:e5][:chosen] = SelectRankRecord.where(:mapareaId => 365).count
  result[:e5][:passed] = PassEventRecord.where(:mapId => 365).count
  if result[:e5][:chosen] < result[:e5][:passed]
    result[:e5][:chosen] = result[:e5][:passed]
  end

  Sinatra::KVDataHelper.set_kv_data("autumn_event_2016_total", result.to_json)
end

def event_map(map_id)
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
    when 361
      result[lv][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [2, 3]).count
      result[lv][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [12, 18], :rank.in =>['S', 'A']).count
    when 362
      result[lv][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [1, 3, 4]).count
      result[lv][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [15, 22], :rank.in =>['S', 'A']).count
    when 363
      result[lv][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [1, 2]).count
      result[lv][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [17, 27], :rank.in =>['S', 'A']).count
    when 364
      result[lv][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId => 15).count
      result[lv][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId => 22, :rank.in =>['S', 'A']).count
    when 365
      result[lv][:battleTotal] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId.in => [28, 29]).count
      result[lv][:battleBoss] = DropShipRecord.where(:mapId => map_id, :mapLv => 3 - idx, :cellId => 20, :rank.in =>['S', 'A']).count
    end

    Sinatra::KVDataHelper.set_kv_data("autumn_event_2016_#{map_id}", result.to_json)
  end
end

event_total()
event_map(361)
event_map(362)
event_map(363)
event_map(364)
event_map(365)

require_relative '../app'
require 'json'

def item(id, evt_name, start_time, end_time)
  map = %Q{
    function() {
      emit(this.mapId + '-' + this.cellId, 1);
    }
  }

  reduce = %Q{
    function(key, values) {
      var reduced = 0;
      values.forEach(function(value) {
        reduced += value;
      });
      return reduced;
    }
  }

  data_S = {}
  DropShipRecord.where(
    :id.gte => BSON::ObjectId.from_time(start_time),
    :id.lte => BSON::ObjectId.from_time(end_time),
    :rank => 'S',
    :itemId => id,
    :origin => /^(?!Kca)/, # temporarily filter Kcanotify
  ).map_reduce(map, reduce).out(inline: 1).each do |q|
    map_id, cell_id = q["_id"].split('-').map(&:to_i)
    cell = KanColleConstant.map[map_id][:cells].find{|c| c[:index].include? cell_id}
    if cell.nil?
      p "#{map_id}/#{cell_id}"
      next
    end
    cell_name = "#{map_id / 10}-#{map_id % 10}-#{cell[:point]}#{cell[:boss] ? "(Boss)" : ""}"
    data_S[cell_name] ||= {count: 0, total: 0}
    data_S[cell_name][:count] += q["value"].to_i
    data_S[cell_name][:total] += DropShipRecord.where(
      :id.gte => BSON::ObjectId.from_time(start_time),
      :id.lte => BSON::ObjectId.from_time(end_time),
      :mapId => map_id,
      :cellId => cell_id,
      :rank => 'S').count
  end
  
  data_A = {}
  DropShipRecord.where(
    :id.gte => BSON::ObjectId.from_time(start_time),
    :id.lte => BSON::ObjectId.from_time(end_time),
    :rank => 'A',
    :itemId => id,
    :origin => /^(?!Kca)/, # temporarily filter Kcanotify
  ).map_reduce(map, reduce).out(inline: 1).each do |q|
    map_id, cell_id = q["_id"].split('-').map(&:to_i)
    cell = KanColleConstant.map[map_id][:cells].find{|c| c[:index].include? cell_id}
    if cell.nil?
      p "#{map_id}/#{cell_id}"
      next
    end
    cell_name = "#{map_id / 10}-#{map_id % 10}-#{cell[:point]}#{cell[:boss] ? "(Boss)" : ""}"
    data_A[cell_name] ||= {count: 0, total: 0}
    data_A[cell_name][:count] += q["value"].to_i
    data_A[cell_name][:total] += DropShipRecord.where(
      :id.gte => BSON::ObjectId.from_time(start_time),
      :id.lte => BSON::ObjectId.from_time(end_time),
      :mapId => map_id,
      :cellId => cell_id,
      :rank => 'A').count
  end

  data = {}
  data_S.each do |map_name, drop_data|
    data[map_name] = {
      s_count: drop_data[:count],
      s_total: drop_data[:total],
      a_count: 0,
      a_total: 0
    }
  end
  data_A.each do |map_name, drop_data|
    data[map_name] ||= {
      s_count: 0,
      s_total: 0,
      a_count: 0,
      a_total: 0
    }
    data[map_name][:a_count] += drop_data[:count]
    data[map_name][:a_total] += drop_data[:total]
  end

  Sinatra::KVDataHelper.set_kv_data("event_#{evt_name}_drop_item_#{id}", data.to_json)

  return data
end

def ship(id, evt_name, start_time, end_time)
  map = %Q{
    function() {
      emit(this.mapId + '-' + this.cellId, 1);
    }
  }

  reduce = %Q{
    function(key, values) {
      var reduced = 0;
      
      values.forEach(function(value) {
        reduced += value;
      });
      
      return reduced;
    }
  }

  data_S = {}
  DropShipRecord.where(
    :id.gte => BSON::ObjectId.from_time(start_time),
    :id.lte => BSON::ObjectId.from_time(end_time),
    :rank => 'S',
    :shipId => id
  ).map_reduce(map, reduce).out(inline: 1).each do |q|
    map_id, cell_id = q["_id"].split('-').map(&:to_i)
    cell = KanColleConstant.map[map_id][:cells].find{|c| c[:index].include? cell_id}
    if cell.nil?
      p "#{map_id}/#{cell_id}"
      next
    end
    cell_name = "#{map_id / 10}-#{map_id % 10}-#{cell[:point]}#{cell[:boss] ? "(Boss)" : ""}"
    data_S[cell_name] ||= {count: 0, total: 0}
    data_S[cell_name][:count] += q["value"].to_i
    data_S[cell_name][:total] += DropShipRecord.where(
      :id.gte => BSON::ObjectId.from_time(start_time),
      :id.lte => BSON::ObjectId.from_time(end_time),
      :mapId => map_id,
      :cellId => cell_id,
      :rank => 'S').count
  end
  
  data_A = {}
  DropShipRecord.where(
    :id.gte => BSON::ObjectId.from_time(start_time),
    :id.lte => BSON::ObjectId.from_time(end_time),
    :rank => 'A',
    :shipId => id
  ).map_reduce(map, reduce).out(inline: 1).each do |q|
    map_id, cell_id = q["_id"].split('-').map(&:to_i)
    cell = KanColleConstant.map[map_id][:cells].find{|c| c[:index].include? cell_id}
    if cell.nil?
      p "#{map_id}/#{cell_id}"
      next
    end
    cell_name = "#{map_id / 10}-#{map_id % 10}-#{cell[:point]}#{cell[:boss] ? "(Boss)" : ""}"
    data_A[cell_name] ||= {count: 0, total: 0}
    data_A[cell_name][:count] += q["value"].to_i
    data_A[cell_name][:total] += DropShipRecord.where(
      :id.gte => BSON::ObjectId.from_time(start_time),
      :id.lte => BSON::ObjectId.from_time(end_time),
      :mapId => map_id,
      :cellId => cell_id,
      :rank => 'A').count
  end

  data = {}
  data_S.each do |map_name, drop_data|
    data[map_name] = {
      s_count: drop_data[:count],
      s_total: drop_data[:total],
      a_count: 0,
      a_total: 0
    }
  end
  data_A.each do |map_name, drop_data|
    data[map_name] ||= {
      s_count: 0,
      s_total: 0,
      a_count: 0,
      a_total: 0
    }
    data[map_name][:a_count] += drop_data[:count]
    data[map_name][:a_total] += drop_data[:total]
  end

  Sinatra::KVDataHelper.set_kv_data("event_#{evt_name}_drop_ship_#{id}", data.to_json)

  return data
end

def merge(key, *arr)
  data = {}

  arr.each do |json|
    json.each do |k, v|
      data[k] ||= {
        s_count: 0,
        s_total: 0,
        a_count: 0,
        a_total: 0,
      }
      data[k][:s_count] += v[:s_count]
      data[k][:s_total] += v[:s_total]
      data[k][:a_count] += v[:a_count]
      data[k][:a_total] += v[:a_total]
    end
  end

  Sinatra::KVDataHelper.set_kv_data(key, data.to_json)
end

[85, 86, 87, 88].each do |id|
  item(id, "food2018_180608", Time.new(2018, 6, 8, 17, 40, 0), Time.now)
  item(id, "food2018_180601", Time.new(2018, 6, 1, 18, 30, 0), Time.new(2018, 6, 8, 17, 40, 0))
end
[517, 518, 524, 525, 531, 540, 551, 552, 565].each do |id|
  ship(id, "food2018", Time.new(2018, 5, 15, 12, 30, 0), Time.now)
end

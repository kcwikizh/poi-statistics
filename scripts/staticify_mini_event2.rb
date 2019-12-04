require_relative '../app'
require 'json'

def item(id, evt_name, start_time, end_time)
  map = %Q{
    function() {
      var enemyShips = this.enemyShips1.concat(this.enemyShips2);
      if (!enemyShips.length) return;

      var val = {};
      val[enemyShips.join(',').replace(/,0/g, ',-1') + ',' + this.enemyFormation] = 1;
      val['total'] = 1;

      emit(this.mapId + '-' + this.cellId, val);
    }
  }

  reduce = %Q{
    function(key, values) {
      var reduced = {};
      values.forEach(function(value) {
        for(var i in value) {
          reduced[i] = reduced[i] || 0;
          reduced[i] += value[i];
        }
      });
      return reduced;
    }
  }
=begin
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
=end
  DropShipRecord.where(
    :id.gte => BSON::ObjectId.from_time(start_time),
    :id.lte => BSON::ObjectId.from_time(end_time),
    :rank.in => ['S', 'A'],
    :itemId => id,
    :origin => /^(?!Kca)/, # temporarily filter Kcanotify
  ).map_reduce(map, reduce).out(inline: 1).each do |q|
    map_id, cell_id = q["_id"].split('-').map(&:to_i)
    cell = KanColleConstant.map[map_id][:cells].find{|c| c[:index].include? cell_id}
    if cell.nil?
      #p "#{map_id}/#{cell_id}"
      next
    end
    cell_name = "#{map_id / 10}-#{map_id % 10}-#{cell[:point]}#{cell[:boss] ? "(Boss)" : ""}"
    p id
    p cell_name + "(" + cell_id.to_s + ")"
    p "count:" + q["value"]["total"].to_s
    p "total:" + DropShipRecord.where(
      :id.gte => BSON::ObjectId.from_time(start_time),
      :id.lte => BSON::ObjectId.from_time(end_time),
      :mapId => map_id,
      :cellId => cell_id,
      :rank.in => ['S', 'A']).count.to_s
    p "enemy:"
    q["value"].each do |k, v|
      next if k=="total"
      e = (k.split(',')[0..-2]).map {|i| i.to_i}

      p k + " : " + v.to_s + " (" + (
        v / DropShipRecord.where(
          :id.gte => BSON::ObjectId.from_time(start_time),
          :id.lte => BSON::ObjectId.from_time(end_time),
          :mapId => map_id,
          :cellId => cell_id,
          :enemyShips1 => e,
          :enemyFormation => k.split(',')[-1].to_i,
          :rank.in => ['S', 'A']).count
      ).to_s + ")"
    end
  end
end

[68, 93].each do |id|
  item(id, "sanma2019", Time.new(2019, 10, 25, 12, 0, 0), Time.now)
end
[517, 518, 524, 525, 531, 552, 565, 584, 585].each do |id|
  ship(id, "sanma2019", Time.new(2019, 10, 25, 12, 0, 0), Time.now)
end

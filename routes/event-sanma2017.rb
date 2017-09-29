require 'json'

get '/event-sanma2017/?' do
  haml :'event-sanma2017/index', :locals => {
    :location => 'event',
    :title_append => " # 活动统计 - 2017年秋刀鱼祭典",
    :item68_data => JSON.parse(get_kv_data("event_sanma2017_drop_item_68")),
    :ship517_data => JSON.parse(get_kv_data("event_sanma2017_drop_ship_517")),
    :ship518_data => JSON.parse(get_kv_data("event_sanma2017_drop_ship_518")),
    :ship524_data => JSON.parse(get_kv_data("event_sanma2017_drop_ship_524")),
    :ship525_data => JSON.parse(get_kv_data("event_sanma2017_drop_ship_525")),
  }
end

get '/event-sanma2017/refresh' do
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
    :id.gte => BSON::ObjectId.from_time(Time.new(2017, 9, 29, 12, 30, 0)),
    :id.lte => BSON::ObjectId.from_time(Time.now),
    :rank => 'S',
    :itemId => 68
  ).map_reduce(map, reduce).out(inline: 1).each do |q|
    map_id, cell_id = q["_id"].split('-').map(&:to_i)
    cell = KanColleConstant.map[map_id][:cells].find{|c| c[:index].include? cell_id}
    cell_name = "#{map_id / 10}-#{map_id % 10}-#{cell[:point]}#{cell[:boss] ? "(Boss)" : ""}"
    data_S[cell_name] ||= {count: 0, total: 0}
    data_S[cell_name][:count] += q["value"].to_i
    data_S[cell_name][:total] += DropShipRecord.where(
      :id.gte => BSON::ObjectId.from_time(Time.new(2017, 9, 29, 12, 30, 0)),
      :id.lte => BSON::ObjectId.from_time(Time.now),
      :mapId => map_id,
      :cellId => cell_id,
      :rank => 'S').count
  end
  
  data_A = {}
  DropShipRecord.where(
    :id.gte => BSON::ObjectId.from_time(Time.new(2017, 9, 29, 12, 30, 0)),
    :id.lte => BSON::ObjectId.from_time(Time.now),
    :rank => 'A',
    :itemId => 68
  ).map_reduce(map, reduce).out(inline: 1).each do |q|
    map_id, cell_id = q["_id"].split('-').map(&:to_i)
    cell = KanColleConstant.map[map_id][:cells].find{|c| c[:index].include? cell_id}
    cell_name = "#{map_id / 10}-#{map_id % 10}-#{cell[:point]}#{cell[:boss] ? "(Boss)" : ""}"
    data_A[cell_name] ||= {count: 0, total: 0}
    data_A[cell_name][:count] += q["value"].to_i
    data_A[cell_name][:total] += DropShipRecord.where(
      :id.gte => BSON::ObjectId.from_time(Time.new(2017, 9, 29, 12, 30, 0)),
      :id.lte => BSON::ObjectId.from_time(Time.now),
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

  set_kv_data("event_sanma2017_drop_item_68", data.to_json)

  [517, 518, 524, 525].each do |ship_id|
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
      :id.gte => BSON::ObjectId.from_time(Time.new(2017, 9, 29, 12, 30, 0)),
      :id.lte => BSON::ObjectId.from_time(Time.now),
      :rank => 'S',
      :shipId => ship_id
    ).map_reduce(map, reduce).out(inline: 1).each do |q|
      map_id, cell_id = q["_id"].split('-').map(&:to_i)
      cell = KanColleConstant.map[map_id][:cells].find{|c| c[:index].include? cell_id}
      cell_name = "#{map_id / 10}-#{map_id % 10}-#{cell[:point]}#{cell[:boss] ? "(Boss)" : ""}"
      data_S[cell_name] ||= {count: 0, total: 0}
      data_S[cell_name][:count] += q["value"].to_i
      data_S[cell_name][:total] += DropShipRecord.where(
        :id.gte => BSON::ObjectId.from_time(Time.new(2017, 9, 29, 12, 30, 0)),
        :id.lte => BSON::ObjectId.from_time(Time.now),
        :mapId => map_id,
        :cellId => cell_id,
        :rank => 'S').count
    end
    
    data_A = {}
    DropShipRecord.where(
      :id.gte => BSON::ObjectId.from_time(Time.new(2017, 9, 29, 12, 30, 0)),
      :id.lte => BSON::ObjectId.from_time(Time.now),
      :rank => 'A',
      :shipId => ship_id
    ).map_reduce(map, reduce).out(inline: 1).each do |q|
      map_id, cell_id = q["_id"].split('-').map(&:to_i)
      cell = KanColleConstant.map[map_id][:cells].find{|c| c[:index].include? cell_id}
      cell_name = "#{map_id / 10}-#{map_id % 10}-#{cell[:point]}#{cell[:boss] ? "(Boss)" : ""}"
      data_A[cell_name] ||= {count: 0, total: 0}
      data_A[cell_name][:count] += q["value"].to_i
      data_A[cell_name][:total] += DropShipRecord.where(
        :id.gte => BSON::ObjectId.from_time(Time.new(2017, 9, 29, 12, 30, 0)),
        :id.lte => BSON::ObjectId.from_time(Time.now),
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
  
    set_kv_data("event_sanma2017_drop_ship_#{ship_id}", data.to_json)
  end

  'ok'
end

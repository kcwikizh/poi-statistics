require 'haml'
require 'json'

get '/drop/index' do
  ship_list = []
  DropShipRecord.distinct(:shipId).each do |id|
    ship_list.push KCConstants.ships[id]
  end

  haml :'drop/index', :locals => { :ships => ship_list }
end

get '/drop/map/:name.?:format?' do
  idx = nil
  KCConstants.maps.each do |key, value|
    idx = key if value.include?(params[:name])
  end

  halt 404 if idx.nil?

  map = %Q{
    function() {
      var counts = { s: 0, a: 0, b: 0, c: 0, d: 0, e: 0 };
      switch(this.rank) {
        case 'S':
          counts.s = 1;
          break;
        case 'A':
          counts.a = 1;
          break;
        case 'B':
          counts.b = 1;
          break;
        case 'C':
          counts.c = 1;
          break;
        case 'D':
          counts.d = 1;
          break;
        case 'E':
          counts.e = 1;
          break;
      }
      emit(this.shipId, counts);
    }
  }

  reduce = %Q{
    function(key, values) {
      var reduced = { s: 0, a: 0, b: 0, c: 0, d: 0, e: 0 };
      values.forEach(function(value) {
        reduced.s += value.s;
        reduced.a += value.a;
        reduced.b += value.b;
        reduced.c += value.c;
        reduced.d += value.d;
        reduced.e += value.e;
      });
      return reduced;
    }
  }

  query_hash = {}
  KCConstants.maps[idx][params[:name]].each do |key, value|
    query_hash["#{key}/#{value}"] = DropShipRecord.where(quest: params[:name], enemy: key).map_reduce(map, reduce).out(inline: 1)
  end

  if params[:format] == 'json'
    result = []
    query_hash.each do |key, values|
      arr = []
      values.each do |v|
        item = {
          name: KCConstants.ships[v['_id'].to_i],
          s:    v['value']['s'].to_i,
          a:    v['value']['a'].to_i,
          b:    v['value']['b'].to_i,
          c:    v['value']['c'].to_i,
          d:    v['value']['d'].to_i,
          e:    v['value']['e'].to_i
        }
        arr.push item
      end
      item = {
        mapcell: key,
        ships:   arr
      }
      result.push item
    end

    content_type :json
    json_obj = { database: 'drop', query: params[:name], result: result }
    json_obj.to_json
  else
    haml :'drop/map/query', :locals => { :query => query_hash }
  end
end

get '/drop/ship/:name.?:format?' do
  idx = nil
  KCConstants.ships.each do |key, value|
    idx = key if value == params[:name]
  end

  halt 404 if idx.nil?

  map = %Q{
    function() {
      var count = { s: 0, a: 0, b: 0, c: 0, d: 0, e: 0 };
      switch(this.rank) {
        case 'S':
          count.s = 1;
          break;
        case 'A':
          count.a = 1;
          break;
        case 'B':
          count.b = 1;
          break;
        case 'C':
          count.c = 1;
          break;
        case 'D':
          count.d = 1;
          break;
        case 'E':
          count.e = 1;
          break;
      }
      emit(this.quest, count);
    }
  }

  reduce = %Q{
    function(key, values) {
      var reduced = { s: 0, a: 0, b: 0, c: 0, d: 0, e: 0 };
      values.forEach(function(value) {
        reduced.s += value.s;
        reduced.a += value.a;
        reduced.b += value.b;
        reduced.c += value.c;
        reduced.d += value.d;
        reduced.e += value.e;
      });
      return reduced;
    }
  }

  query = DropShipRecord.where(shipId: idx).map_reduce(map, reduce).out(inline: 1)

  if params[:format] == 'json'
    result = []
    query.each do |v|
       item = {
        map: v['_id'],
        s:   v['value']['s'].to_i,
        a:   v['value']['a'].to_i,
        b:   v['value']['b'].to_i,
        c:   v['value']['c'].to_i,
        d:   v['value']['d'].to_i,
        e:   v['value']['e'].to_i
      }
      result.push item
    end

    content_type :json
    json_obj = { database: 'drop', query: params[:name], result: result }
    json_obj.to_json
  else
    haml :'drop/ship/query', :locals => { :query => query }
  end
end

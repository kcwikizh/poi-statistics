require 'haml'

get /\/drop\/?/ do
  ship_list = []
  DropShipRecord.distinct(:shipId).each do |id|
    ship_list.push KCConstants.ships[id]
  end

  haml :'drop/index', :locals => { :ships => ship_list }
end

get '/drop/map/:name' do
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

  haml :'drop/map/query', :locals => { :query => query_hash }
end

get '/drop/ship/:name' do
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

  haml :'drop/ship/query', :locals => { :query => query }
end

require 'haml'
require 'json'

get '/construction/?' do
  haml :'construction/index', :locals => {
    :location => 'construction',
    :title_append => " # 建造统计"
  }
end

get '/construction/ship/:name.?:format?' do
  idx = nil
  KCConstants.ships.each do |key, value|
    idx = key if value == params[:name]
  end

  halt 404 if idx.nil?

  map = %Q{
    function() {
      emit(this.items.join('/'), { count: 1 });
    }
  }

  reduce = %Q{
    function(key, values) {
      var reduced = { count: 0 };
      values.forEach(function(value) {
        reduced.count += value.count;
      });
      return reduced;
    }
  }

  query = CreateShipRecord.where(shipId: idx).map_reduce(map, reduce).out(inline: 1)

  if params[:format] == 'json'
    result = []
    query.each do |v|
      item = {
        items: v['_id'].split('/').map {|i| i.to_i},
        count: v['value']['count'].to_i
      }
      result.push item
    end

    content_type :json
    json_obj = { database: 'construction', query: params[:name], result: result }
    json_obj.to_json
  else
    haml :'construction/ship/query', :locals => { :query => query }
  end
end

get '/construction/recipe/:fuel/:ammo/:steel/:bauxite/:devkit.?:format?' do
  map = %Q{
    function() {
      emit(this.shipId, { count: 1 });
    }
  }

  reduce = %Q{
    function(key, values) {
      var reduced = { count: 0 };
      values.forEach(function(value) {
        reduced.count += value.count;
      });
      return reduced;
    }
  }

  recipe = [
    params[:fuel].to_i,
    params[:ammo].to_i,
    params[:steel].to_i,
    params[:bauxite].to_i,
    params[:devkit].to_i
  ]
  query = CreateShipRecord.where(items: recipe).map_reduce(map, reduce).out(inline: 1)

  if params[:format] == 'json'
    result = []
    query.each do |v|
      item = {
        ship:  KCConstants.ships[v['_id'].to_i],
        count: v['value']['count'].to_i
      }
      result.push item
    end

    content_type :json
    json_obj = { database: 'construction', query: recipe, result: result }
    json_obj.to_json
  else
    haml :'construction/recipe/query', :locals => { :query => query }
  end
end

require 'haml'

get /\/construction\/?/ do
  ship_list = []
  CreateShipRecord.distinct(:shipId).each do |id|
    ship_list.push KCConstants.ships[id]
  end

  recipe_list = []
  map = %Q{
    function() {
      emit(this.items, this.items.join('/'));
    }
  }
  reduce = %Q{
    function(key, values) {
      return key.join('/');
    }
  }
  CreateShipRecord.map_reduce(map, reduce).out(inline: 1).each do |item|
    recipe_list.push item["value"]
  end

  haml :'construction/index', :locals => { :ships => ship_list, :recipes => recipe_list }
end

get '/construction/ship/:name' do
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
  
  haml :'construction/ship/query', :locals => { :query => query }
end

get '/construction/recipe/:fuel/:ammo/:steel/:bauxite/:devkit' do
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
  
  haml :'construction/recipe/query', :locals => { :query => query }
end

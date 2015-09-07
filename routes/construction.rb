require 'haml'
require 'json'

get '/construction/?' do
  map = %Q{
    function() {
      var val = 1;
      emit(this.items.join('-'), val);
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

  recipe = []
  CreateShipRecord.where(:origin => /Reporter/)
    .map_reduce(map, reduce).out(inline: 1).each do |q|
      recipe.push({
        items: q['_id'].split('-').map(&:to_i),
        count: q['value'].to_i
      })
    end

  cache_set("crl", recipe)

  haml :'construction/index', :locals => {
    :location => 'construction',
    :title_append => " # 建造统计"
  }
end

get '/construction/ship/:name.?:format?' do
  ship_id = nil
  KCConstants.ships.each do |key, value|
    ship_id = key if value == params[:name]
  end

  halt 404 if ship_id.nil?

  params[:format] ||= 'html'
  if params[:format] == 'html'
    return haml :'construction/ship/query', :locals => {
      :location => 'construction',
      :query_by => 'ship',
      :ship_id => ship_id,
      :title_append => " # 建造统计 - #{params[:name]}",
    }
  end

  halt 404 unless params[:format] == 'json'

  map = %Q{
    function() {
      var val = {
        secretary: {},
        hqLv: [this.teitokuLv, this.teitokuLv],
        kdock: [0, 0, 0, 0]
      }

      val.secretary[this.secretary] = val.secretary[this.secretary] || 1;
      val.kdock[this.kdockId] = 1;

      emit(this.items.join('-'), val);
    }
  }

  reduce = %Q{
    function(key, values) {
      var reduced = {
        secretary: {},
        hqLv: [151, 0],
        kdock: [0, 0, 0, 0]
      };

      values.forEach(function(value) {
        if (value.hqLv[0] < reduced.hqLv[0]) {
          reduced.hqLv[0] = value.hqLv[0];
        }
        if (value.hqLv[1] > reduced.hqLv[1]) {
          reduced.hqLv[1] = value.hqLv[1];
        }

        for(var s in value.secretary) {
          reduced.secretary[s] = reduced.secretary[s] || 0;
          reduced.secretary[s] += value.secretary[s];
        }

        reduced.kdock[0] += value.kdock[0];
        reduced.kdock[1] += value.kdock[1];
        reduced.kdock[2] += value.kdock[2];
        reduced.kdock[3] += value.kdock[3];
      });

      return reduced;
    }
  }

  # query now

  recipes = []
  total_count = 0
  CreateShipRecord.where(:origin => /Reporter/).where(shipId: ship_id)
    .map_reduce(map, reduce).out(inline: 1).each do |q|
      secretary = []
      q['value']['secretary'].each do |k, v|
        secretary.push({
          name: KCConstants.ship[k.to_i][:name],
          count: v.to_i
        })
      end

      crl = cache_get_or_return("crl", 0) do
        [{
          items: q['_id'].split('-').map(&:to_i),
          count: CreateShipRecord.where(:origin.exists => true, :items => q['_id'].split('-').map(&:to_i)).count
        }]
      end

      recipes.push({
        items: q['_id'].split('-').map(&:to_i),
        count: q['value']['kdock'].map(&:to_i).inject(&:+),
        hqLvRange: q['value']['hqLv'].map(&:to_i),
        secretaryCount: secretary,
        kdockCount: q['value']['kdock'].map(&:to_i),
        recipeCount: crl.select{|r| r[:items] == q['_id'].split('-').map(&:to_i)}.first[:count]
      })

      total_count += q['value']['kdock'].map(&:to_i).inject(&:+)
    end
  result = {
    recipes: recipes,
    count: total_count
  }

  content_type :json
  json_obj = { database: 'construction', query: params[:name], result: result }
  json_obj.to_json
end

get '/construction/recipe/:fuel-:ammo-:steel-:bauxite-:devkit.?:format?' do
  recipe = [
    params[:fuel].to_i,
    params[:ammo].to_i,
    params[:steel].to_i,
    params[:bauxite].to_i,
    params[:devkit].to_i
  ]

  params[:format] ||= 'html'
  if params[:format] == 'html'
    return haml :'construction/recipe/query', :locals => {
      :location => 'construction',
      :query_by => 'recipe',
      :recipe => recipe,
      :title_append => " # 建造统计 - #{recipe.join('-')}",
    }
  end

  map = %Q{
    function() {
      var val = {
        secretary: {},
        hqLv: [this.teitokuLv, this.teitokuLv],
        kdock: [0, 0, 0, 0]
      }

      val.secretary[this.secretary] = val.secretary[this.secretary] || 1;
      val.kdock[this.kdockId] = 1;

      emit(this.shipId, val);
    }
  }

  reduce = %Q{
    function(key, values) {
      var reduced = {
        secretary: {},
        hqLv: [151, 0],
        kdock: [0, 0, 0, 0]
      };

      values.forEach(function(value) {
        if (value.hqLv[0] < reduced.hqLv[0]) {
          reduced.hqLv[0] = value.hqLv[0];
        }
        if (value.hqLv[1] > reduced.hqLv[1]) {
          reduced.hqLv[1] = value.hqLv[1];
        }

        for(var s in value.secretary) {
          reduced.secretary[s] = reduced.secretary[s] || 0;
          reduced.secretary[s] += value.secretary[s];
        }

        reduced.kdock[0] += value.kdock[0];
        reduced.kdock[1] += value.kdock[1];
        reduced.kdock[2] += value.kdock[2];
        reduced.kdock[3] += value.kdock[3];
      });

      return reduced;
    }
  }

  # query now

  ships = []
  total_kdock_count = [0, 0, 0, 0]
  CreateShipRecord.where(:origin => /Reporter/).where(items: recipe)
    .map_reduce(map, reduce).out(inline: 1).each do |q|
      secretary = []
      q['value']['secretary'].each do |k, v|
        secretary.push({
          name: KCConstants.ship[k.to_i][:name],
          count: v.to_i
        })
      end

      ships.push({
        name: KCConstants.ship[q['_id'].to_i][:name],
        count: q['value']['kdock'].map(&:to_i).inject(&:+),
        hqLvRange: q['value']['hqLv'].map(&:to_i),
        secretaryCount: secretary,
        kdockCount: q['value']['kdock'].map(&:to_i)
      })

      cache_set("cr#{recipe.join('-')}s#{q['_id'].to_i}", q['value']['kdock'].map(&:to_i).inject(&:+))

      total_kdock_count = total_kdock_count.zip(q['value']['kdock'].map(&:to_i)).map {|z| z.inject(&:+)}
    end
  result = {
    ships: ships,
    count: total_kdock_count.inject(&:+),
    kdockCount: total_kdock_count
  }

  content_type :json
  json_obj = { database: 'construction', query: recipe.join('-'), result: result }
  json_obj.to_json
end

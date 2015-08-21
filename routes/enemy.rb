get '/enemy/:mid.?:format?' do
  map = %Q{
    function() {
      var val = {
        fEnemy: {},
        sEnemy: {},
        tEnemy: {},
        xEnemy: {},
      }

      var enemy = this.enemyShips.join('/') + '/' + this.enemyFormation;

      switch(this.mapLv) {
        case 0:
          val.xEnemy[enemy] = 1;
          break;
        case 1:
          val.tEnemy[enemy] = 1;
          break;
        case 2:
          val.sEnemy[enemy] = 1;
          break;
        case 3:
          val.fEnemy[enemy] = 1;
          break;
      }

      emit(this.cellId, val);
    }
  }

  reduce = %Q{
    function(key, values) {
      var reduced = {
        fEnemy: {},
        sEnemy: {},
        tEnemy: {},
        xEnemy: {},
      };

      values.forEach(function(value) {
        for(var e in value.fEnemy) {
          reduced.fEnemy[e] = reduced.fEnemy[e] || 0;
          reduced.fEnemy[e] += value.fEnemy[e];
        }
        for(var e in value.sEnemy) {
          reduced.sEnemy[e] = reduced.sEnemy[e] || 0;
          reduced.sEnemy[e] += value.sEnemy[e];
        }
        for(var e in value.tEnemy) {
          reduced.tEnemy[e] = reduced.tEnemy[e] || 0;
          reduced.tEnemy[e] += value.tEnemy[e];
        }
        for(var e in value.xEnemy) {
          reduced.xEnemy[e] = reduced.xEnemy[e] || 0;
          reduced.xEnemy[e] += value.xEnemy[e];
        }
      });

      return reduced;
    }
  }

  # query now

  mid = params[:mid].to_i
  result = []
  DropShipRecord.where(:mapId => mid)
    .map_reduce(map, reduce).out(inline: 1).each do |q|
      result.push "#{KCConstants.cells[mid][q['_id'].to_i]} (#{q['_id'].to_i})"

      if q['value']['xEnemy'].count == 0
        result.push "甲："
        q['value']['fEnemy'].each do |k, v|
          idx = k.split('/')
          e = (idx[0..5].map {|i| i == '-1' ? nil : "#{KCConstants.ships[i.to_i]}(#{i.to_i})"}).compact
          result.push "#{e.join('/')}(#{KCConstants.formations[idx[6].to_i]}) - #{v.to_i}"
        end

        result.push "乙："
        q['value']['sEnemy'].each do |k, v|
          idx = k.split('/')
          e = (idx[0..5].map {|i| i == '-1' ? nil : "#{KCConstants.ships[i.to_i]}(#{i.to_i})"}).compact
          result.push "#{e.join('/')}(#{KCConstants.formations[idx[6].to_i]}) - #{v.to_i}"
        end

        result.push "丙："
        q['value']['tEnemy'].each do |k, v|
          idx = k.split('/')
          e = (idx[0..5].map {|i| i == '-1' ? nil : "#{KCConstants.ships[i.to_i]}(#{i.to_i})"}).compact
          result.push "#{e.join('/')}(#{KCConstants.formations[idx[6].to_i]}) - #{v.to_i}"
        end
      else
        q['value']['xEnemy'].each do |k, v|
          idx = k.split('/')
          e = (idx[0..5].map {|i| i == '-1' ? nil : "#{KCConstants.ships[i.to_i]}(#{i.to_i})"}).compact
          result.push "#{e.join('/')}(#{KCConstants.formations[idx[6].to_i]}) - #{v.to_i}"
        end
      end

      result.push '<br />'
  end

  result.join('<br/>')
end

get '/enemy2/:mid.?:format?' do
  map = %Q{
    function() {
      var val = {
        fEnemy: {},
        sEnemy: {},
        tEnemy: {},
        xEnemy: {},
      }

      var enemy = this.enemyShips.join('/') + '/' + this.enemyFormation;

      switch(this.mapLv) {
        case 0:
          val.xEnemy[enemy] = 1;
          break;
        case 1:
          val.tEnemy[enemy] = 1;
          break;
        case 2:
          val.sEnemy[enemy] = 1;
          break;
        case 3:
          val.fEnemy[enemy] = 1;
          break;
      }

      emit(this.cellId, val);
    }
  }

  reduce = %Q{
    function(key, values) {
      var reduced = {
        fEnemy: {},
        sEnemy: {},
        tEnemy: {},
        xEnemy: {},
      };

      values.forEach(function(value) {
        for(var e in value.fEnemy) {
          reduced.fEnemy[e] = reduced.fEnemy[e] || 0;
          reduced.fEnemy[e] += value.fEnemy[e];
        }
        for(var e in value.sEnemy) {
          reduced.sEnemy[e] = reduced.sEnemy[e] || 0;
          reduced.sEnemy[e] += value.sEnemy[e];
        }
        for(var e in value.tEnemy) {
          reduced.tEnemy[e] = reduced.tEnemy[e] || 0;
          reduced.tEnemy[e] += value.tEnemy[e];
        }
        for(var e in value.xEnemy) {
          reduced.xEnemy[e] = reduced.xEnemy[e] || 0;
          reduced.xEnemy[e] += value.xEnemy[e];
        }
      });

      return reduced;
    }
  }

  # query now

  mid = params[:mid].to_i
  result = []
  DropShipRecord.where(:mapId => mid)
    .map_reduce(map, reduce).out(inline: 1).each do |q|
      result.push "#{KCConstants.cells[mid][q['_id'].to_i]} (#{q['_id'].to_i})"

      if q['value']['xEnemy'].count == 0
        result.push "甲："
        q['value']['fEnemy'].each do |k, v|
          idx = k.split('/')
          e = (idx[0..5].map {|i| i == '-1' ? nil : "#{KCConstants.ships[i.to_i]}"}).compact
          result.push "#{e.join('|')}(#{KCConstants.formations[idx[6].to_i]})"
        end

        result.push "乙："
        q['value']['sEnemy'].each do |k, v|
          idx = k.split('/')
          e = (idx[0..5].map {|i| i == '-1' ? nil : "#{KCConstants.ships[i.to_i]}"}).compact
          result.push "#{e.join('|')}(#{KCConstants.formations[idx[6].to_i]})"
        end

        result.push "丙："
        q['value']['tEnemy'].each do |k, v|
          idx = k.split('/')
          e = (idx[0..5].map {|i| i == '-1' ? nil : "#{KCConstants.ships[i.to_i]}"}).compact
          result.push "#{e.join('|')}(#{KCConstants.formations[idx[6].to_i]})"
        end
      else
        q['value']['xEnemy'].each do |k, v|
          idx = k.split('/')
          e = (idx[0..5].map {|i| i == '-1' ? nil : "#{KCConstants.ships[i.to_i]}"}).compact
          result.push "#{e.join('|')}(#{KCConstants.formations[idx[6].to_i]})"
        end
      end

      result.push '<br />'
  end

  result.join('<br/>')
end

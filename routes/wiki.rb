get '/wiki/drop/:mid.?:format?' do
  map_id = params[:mid].to_i

  enemy_hash = {}
  DropShipRecord.where(mapId: map_id).distinct(:cellId).sort.each do |cell_id|
    enemy_hash[KCConstants.cells[map_id][cell_id]] ||= []
    enemy_hash[KCConstants.cells[map_id][cell_id]].push cell_id
  end

  result = []
  enemy_hash.each do |enemy_name, cell_id_list|
    ship_list = DropShipRecord.where(:mapId => map_id, :quest => KCConstants.maps[map_id], :cellId.in => cell_id_list, :shipId.gt => -1).distinct(:shipId)
    result.push({ name: enemy_name, ships: ship_list})
  end

  response = ''
  result.each do |item|
    item[:name] =~ /(.+?)\(((E\d+)|(\d+-\d+))-(?<pos>[A-Z])\)/
    pos = $~["pos"]
    arr = item[:ships].group_by do |x|
      info = KCConstants.ship_infos[KCConstants.ships[x]]
      case info[:ship_type]
      when 'dd'
        '驱逐舰'
      when 'cl'
        '轻巡洋舰'
      when 'ca'
        '重巡洋舰'
      when 'bb'
        '战列舰'
      when 'cv'
        '空母类'
      when 'cvl'
        '空母类'
      else
        '其他'
      end
    end

    response += "{{掉落表<br/> |海域点 =#{pos}<br/> |掉落 ="
    ['驱逐舰', '轻巡洋舰', '重巡洋舰', '战列舰', '空母类', '其他'].each do |type|
      response += "'''#{type}'''："
      if arr.include?(type)
        response += (arr[type].map do |i|
          ship = KCConstants.ships[i]
          info = KCConstants.ship_infos[ship]
          if info[:rare]
            "{{稀有舰|#{info[:chinese_name]}}}"
          else
            "[[#{info[:chinese_name]}]]"
          end
        end).join('、')
      end
      response += "&lt;br/&gt;"
    end

    response += "}}<br/>"
  end

  response
end

get '/wiki/enemy/:mid.json' do
  map_id = params[:mid].to_i

  enemy_hash = {}
  DropShipRecord.where(mapId: map_id).distinct(:cellId).sort.each do |cell_id|
    if KCConstants.cells[map_id].include? cell_id
      enemy_hash[KCConstants.cells[map_id][cell_id]] ||= []
      enemy_hash[KCConstants.cells[map_id][cell_id]].push cell_id
    end
  end

  map = %Q{
    function() {
      var val = {
        hqLv: [this.teitokuLv, this.teitokuLv]
      }

      emit(this.enemyShips.join('/') + '/' + this.enemyFormation, val);
    }
  }

  reduce = %Q{
    function(key, values) {
      var reduced = {
        hqLv: [151, 0]
      };

      values.forEach(function(value) {
        if (value.hqLv[0] < reduced.hqLv[0]) {
          reduced.hqLv[0] = value.hqLv[0];
        }
        if (value.hqLv[1] > reduced.hqLv[1]) {
          reduced.hqLv[1] = value.hqLv[1];
        }
      });

      return reduced;
    }
  }

  enemies = []
  enemy_hash.each do |enemy_name, cell_id_list|
    enemy_name =~ /(?<name>.+?)\(((E\d+)|(\d+-\d+))-(?<pos>[A-Z])\)/
    name = $~["name"]; pos = $~["pos"]

    if map_id > 310
      enemy_lv_fleets = []
      [3, 2, 1].each do |i|
        enemy_fleets = []
        DropShipRecord.where(:mapId => map_id, :quest => KCConstants.maps[map_id], :enemy => name, :cellId.in => cell_id_list, :mapLv => i)
          .map_reduce(map, reduce).out(inline: 1).each do |q|
            data = q['_id'].split('/').map(&:to_i)
            enemy_fleets.push({
              ships: data.take(6),
              formation: data[-1],
              hqLvRange: q['value']['hqLv'].map(&:to_i)
            })
          end
        enemy_lv_fleets.push({
          level: i,
          fleets: enemy_fleets
        })
      end

      enemies.push({
        name: name,
        point: pos,
        levels: enemy_lv_fleets
      })
    else
      enemy_fleets = []
      DropShipRecord.where(:mapId => map_id, :quest => KCConstants.maps[map_id], :cellId.in => cell_id_list, :enemy => name)
        .map_reduce(map, reduce).out(inline: 1).each do |q|
          data = q['_id'].split('/').map(&:to_i)
          enemy_fleets.push({
            ships: data.take(6),
            formation: data[-1],
            hqLvRange: q['value']['hqLv'].map(&:to_i)
          })
        end
      enemies.push({
        name: name,
        point: pos,
        fleets: enemy_fleets
      })
    end
  end

  content_type :json
  json_obj = enemies
  json_obj.to_json
end

get '/wiki/enemy2/:mid.html' do
  map_id = params[:mid].to_i

  result = ""
  enemy_hash={}
  DropShipRecord.where(mapId: map_id).distinct(:cellId).sort.each do |cell_id|
    if KCConstants.cells[map_id].include? cell_id
      enemy_hash[KCConstants.cells[map_id][cell_id]] ||= []
      enemy_hash[KCConstants.cells[map_id][cell_id]].push cell_id
    end
  end

  map = %Q{
    function() {
      var val = {
        hqLv: [this.teitokuLv, this.teitokuLv],
        count: 1
      }

      emit(this.enemyShips.join('/') + '/' + this.enemyFormation, val);
    }
  }

  reduce = %Q{
    function(key, values) {
      var reduced = {
        hqLv: [151, 0],
        count: 0
      };

      values.forEach(function(value) {
        if (value.hqLv[0] < reduced.hqLv[0]) {
          reduced.hqLv[0] = value.hqLv[0];
        }
        if (value.hqLv[1] > reduced.hqLv[1]) {
          reduced.hqLv[1] = value.hqLv[1];
        }
        reduced.count += value.count
      });

      return reduced;
    }
  }

  enemies = []
  enemy_hash.each do |enemy_name, cell_id_list|
    enemy_name =~ /(?<name>.+?)\(((E\d+)|(\d+-\d+))-(?<pos>[A-Z])\)/
    name = $~["name"]; pos = $~["pos"]

    if map_id > 310
      [3, 2, 1].each do |i|
        xxx = 0
        result += case
        when i==3
          "甲：<br/>"
                  when i==2
                     "乙：<br/>"
                  when i==1
                     "丙：<br/>"
                end
        result += %Q({{敌方配置表<br/>   |海域点       =#{pos}<br/>   |海域点原名   =#{name}<br/>   |海域点译名   =<br/>)
        sum = DropShipRecord.where(:mapId => map_id,
          :quest => KCConstants.maps[map_id], :enemy => name, :cellId.in => cell_id_list,
          :mapLv => i, :origin => /^[^K]/).count
        DropShipRecord.where(:mapId => map_id,
          :quest => KCConstants.maps[map_id], :enemy => name, :cellId.in => cell_id_list,
          :mapLv => i, :origin => /^[^K]/)
          .map_reduce(map, reduce).out(inline: 1).each do |q|
            if (sum > 1000 && q['value']['count'].to_f / sum > 0.005) || sum <= 1000
              data = q['_id'].split('/').map(&:to_i)
              result += "   |阵型#{xxx==0?" ":"#{xxx}"}        =#{KCConstants.formation[data[-1]]}<br/>"
              result += "   |敌方#{xxx==0?" ":"#{xxx}"}        ="
              data.take(6).each do |d|
                next if d == -1
                result += "{{深海横幅|#{d}}}"
              end
              result += "<br/>"
              xxx+=1
            end
          end
        result += "}}<br/>"
      end
      result += "<br/>"
    end
  end
  result
end

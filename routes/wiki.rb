get '/wiki/drop/:mid.?:format?' do
  map_id = params[:mid].to_i
  response = ''

  KanColleConstant.map[map_id][:cells].sort{|x, y| x[:point] <=> y[:point]}.each do |cell|
    drop_list = DropShipStatistic.where(
      :map_id => map_id,
      :point_id => cell[:point],
      :ship_id.gt => -1
    ).distinct(:ship_id).group_by do |x|
      case KCConstants.ship_infos[KCConstants.ships[x]][:ship_type]
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

    response += "{{掉落表<br/> |海域点 =#{cell[:point]}<br/> |掉落 ="
    ['驱逐舰', '轻巡洋舰', '重巡洋舰', '战列舰', '空母类', '其他'].each do |type|
      next if !drop_list.include?(type)
      response += "'''#{type}'''："

      response += (drop_list[type].map do |i|
        ship = KCConstants.ships[i]
        info = KCConstants.ship_infos[ship]
        if info[:rare]
          "{{稀有舰|#{info[:chinese_name]}}}"
        else
          "[[#{info[:chinese_name]}]]"
        end
      end).join('、')

      response += "&lt;br/&gt;"
    end

    response += "<br/>}}<br/>"
  end

  response
end

get '/wiki/enemy/:mid.?:format?' do
  map_id = params[:mid].to_i
  result = ''

  map_func = %Q{
    function() {
      emit(this.enemy_fleet.join('/') + '/' + this.enemy_formation, 1);
    }
  }

  reduce_func = %Q{
    function(key, values) {
      var reduced = 0;

      values.forEach(function(value) {
        reduced += value;
      });

      return reduced;
    }
  }

  levels = []
  if map_id > 200
    levels = [3, 2, 1]
  else
    levels = [0]
  end

  KanColleConstant.map[map_id][:cells].sort{|x, y| x[:point] <=> y[:point]}.each do |cell|
    levels.each do |i|
      count = 0
      result += case i
        when 3
          "甲：<br/>"
        when 2
          "乙：<br/>"
        when 1
          "丙：<br/>"
        when 0
          ""
      end
      result += %Q({{敌方配置表<br/>   |海域点       =#{cell[:point]}<br/>   |海域点原名   =#{cell[:name]}<br/>   |海域点译名   =<br/>)
      sum = DropShipStatistic.where(
        :map_id => map_id,
        :point_id => cell[:point],
        :level_no => i
      ).sum(:count)
      DropShipStatistic.where(
        :map_id => map_id,
        :point_id => cell[:point],
        :level_no => i
      ).map_reduce(map_func, reduce_func).out(inline: 1).each do |q|
        if (sum > 1000 && q['value'].to_f / sum > 0.005) || sum <= 1000
          data = q['_id'].split('/').map(&:to_i)
          result += "   |阵型#{count == 0 ? " " : "#{count}"}        =#{KCConstants.formation[data[-1]]}<br/>"
          result += "   |敌方#{count == 0 ? " " : "#{count}"}        ="
          data.take(6).each do |d|
            next if d == -1
            result += "{{深海横幅|#{d}}}"
          end
          result += "<br/>"
          count += 1
        end
      end
      result += "}}<br/>"
    end
    result += "<br/>"
  end

  result
end

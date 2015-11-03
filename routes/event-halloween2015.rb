get '/event-halloween2015/?' do
  map = %Q{
    function() {
      var val = {
        count: 0,
        total: 1
      };

      if (this.shipId == 443) {
        val.count = 1;
      }

      if (kcsconst[this.mapId] != undefined && kcsconst[this.mapId][this.cellId] != undefined)
        emit(kcsconst[this.mapId][this.cellId], val);
    }
  }

  reduce = %Q{
    function(key, values) {
      var reduced = {
        count: 0,
        total: 0
      };

      values.forEach(function(value) {
        reduced.count += value.count;
        reduced.total += value.total;
      });

      return reduced;
    }
  }

  data = []
  DropShipRecord.where(
    :id.gte => BSON::ObjectId.from_time(Time.new(2015, 10, 30, 3, 0, 0)),
    :id.lte => BSON::ObjectId.from_time(Time.now),
    :rank => 'S'
  ).map_reduce(map, reduce).scope(kcsconst: KCConstants.cells)
    .out(inline: 1).each do |q|
      if q["value"]["count"].to_i == 0
        next
      end
      /\((\d+)-(\d+)/ =~ q["_id"]
      areaId = $1.to_i
      mapId = $2.to_i
      item = {
        mapName: "#{KCConstants.maps[areaId * 10 + mapId]} (#{areaId}-#{mapId})",
        cellName: q["_id"].gsub(/\d+-\d+-/, ''),
        count: q["value"]["count"].to_i,
        total: q["value"]["total"].to_i,
      }
      item[:rate] = (item[:count] * 100.0 / item[:total]).round(3)
      data.push item
  end

  haml :'event-sanma2015/index', :locals => {
    :location => 'event',
    :title_append => " # 活动统计 - 2015年万圣节",
    :data => data,
  }
end

def get_map_func(id)
  return %Q{
    function() {
      var val = {
        count: 0,
        total: 1
      };

      if (this.shipId == #{id}) {
        val.count = 1;
      }

      if (kcsconst[this.mapId] != undefined && kcsconst[this.mapId][this.cellId] != undefined && kcsconst[this.mapId])
        emit(kcsconst[this.mapId][this.cellId], val);
    }
  }
end

get '/event-christmas2015/?' do
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
  [441, 183, 459, 169, 190].each do |ship_id|
    datum = []
    DropShipRecord.where(
      :id.gte => BSON::ObjectId.from_time(Time.new(2015, 12, 8, 3, 0, 0)),
      :id.lte => BSON::ObjectId.from_time(Time.now),
      :rank => 'S'
    ).map_reduce(get_map_func(ship_id), reduce).scope(kcsconst: KCConstants.cells)
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
      datum.push item
    end
    data.push datum
  end

  haml :'event-christmas2015/index', :locals => {
    :location => 'event',
    :title_append => " # 活动统计 - 2015年圣诞节",
    :data => data,
  }
end

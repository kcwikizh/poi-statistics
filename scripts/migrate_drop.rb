require_relative '../app'

time_range = {
  from: Time.parse(Sinatra::KVDataHelper.get_kv_data("migrate_drop")),
  to: DropShipRecord.desc(:id).first.id.generation_time + 1
}

common_maps = [(11..16).to_a, (21..25).to_a, (31..35).to_a, (41..45).to_a, (51..55).to_a, (61..64).to_a].flatten
common_table = DropRecord
event_maps = []
event_table = DropRecordSummer2015

map_func = %Q{
  function() {
    val = {
      origin: {},
      hqLv: {},
      count: NumberInt(1)
    };

    if (this.origin == null) return;
    if (this.teitokuLv == null) return;

    var origin = this.origin.match(new RegExp(uaList.join('|')));
    if (origin == null) return;
    origin = origin[0].replace(/[ \.]/g, '_');
    val.origin[origin] = 1;
    val.hqLv[this.teitokuLv] = 1;

    var date = this._id.getTimestamp();
    var hour = date.getHours() * 10;
    var min = Math.floor(date.getMinutes() / 10);

    emit(this.enemyShips.join(',') + ',' + this.enemyFormation + '/' + (hour + min).toString(), val);
  }
}

reduce_func = %Q{
  function(key, values) {
    var reduced = {
      origin: {},
      hqLv: {},
      count: NumberInt(0)
    };

    values.forEach(function(value) {
      reduced.count += value.count;

      for(var ua in value.origin) {
        reduced.origin[ua] = reduced.origin[ua] || 0;
        reduced.origin[ua] += value.origin[ua];
      }
      for(var lv in value.hqLv) {
        reduced.hqLv[lv] = reduced.hqLv[lv] || 0;
        reduced.hqLv[lv] += value.hqLv[lv];
      }
    });

    return reduced;
  }
}

common_maps.each do |map_id|
  KanColleConstant.map[map_id][:cells].each do |cell_obj|
    DropShipRecord.where(
      :id.gte => BSON::ObjectId.from_time(time_range[:from]),
      :id.lt  => BSON::ObjectId.from_time(time_range[:to]),
      :mapId  => map_id,
      :cellId.in => cell_obj[:index]
    ).distinct(:shipId).to_a.each do |ship_id|
      cell_obj[:index].each do |cell_id|
        ['S', 'A', 'B', 'C', 'D', 'E'].each do |rank|
          puts "#{map_id}:#{ship_id}:#{cell_id}:#{rank}"
          DropShipRecord.where(
            :id.gte => BSON::ObjectId.from_time(time_range[:from]),
            :id.lt  => BSON::ObjectId.from_time(time_range[:to]),
            :mapId  => map_id,
            :quest  => KanColleConstant.map[map_id][:name],
            :cellId => cell_id,
            :enemy  => cell_obj[:name],
            :mapLv  => 0,
            :shipId => ship_id,
            :rank   => rank
          ).map_reduce(
            map_func,
            reduce_func
          ).scope(uaList: UAWhiteList.filters).out(inline: 1).each do |q|
            qid = q["_id"].split('/')
            fleet = qid[0]
            time_no = qid[1].to_i
            values = q["value"]
            record = common_table.where(
              "ship = :s AND map = :m AND cell = :c AND level = :l AND rank = :r AND enemy = :e AND time_no = :t",
              {
                s: ship_id,
                m: map_id,
                c: cell_id,
                l: 0,
                r: rank,
                e: fleet,
                t: time_no
              }
            ).first_or_create(
              ship: ship_id,
              map: map_id,
              cell: cell_id,
              level: 0,
              rank: rank,
              enemy: fleet,
              time_no: time_no
            )
            record.count += values['count']
            record.hq_lv.merge!(Hash[values['hqLv'].map{|k, v| [k, v.to_i]}]) { |k, v1, v2| (v1 + v2) }
            record.origin.merge!(Hash[values['origin'].map{|k, v| [k, v.to_i]}]) { |k, v1, v2| (v1 + v2) }
            record.save
          end
        end
      end
    end
  end
end

event_maps.each do |map_id|
  KanColleConstant.map[map_id][:cells].each do |cell_obj|
    DropShipRecord.where(
      :id.gte => BSON::ObjectId.from_time(time_range[:from]),
      :id.lt  => BSON::ObjectId.from_time(time_range[:to]),
      :mapId  => map_id,
      :cellId.in => cell_obj[:index]
    ).distinct(:shipId).to_a.each do |ship_id|
      cell_obj[:index].each do |cell_id|
        ['S', 'A', 'B', 'C', 'D', 'E'].each do |rank|
          (1..3).to_a.each do |level_no|
            puts "#{map_id}:#{ship_id}:#{cell_id}:#{rank}:#{level_no}"
            DropShipRecord.where(
              :id.gte => BSON::ObjectId.from_time(time_range[:from]),
              :id.lt  => BSON::ObjectId.from_time(time_range[:to]),
              :mapId  => map_id,
              :quest  => KanColleConstant.map[map_id][:name],
              :cellId => cell_id,
              :enemy  => cell_obj[:name],
              :mapLv  => level_no,
              :shipId => ship_id,
              :rank   => rank
            ).map_reduce(
              map_func,
              reduce_func
            ).scope(uaList: UAWhiteList.filters).out(inline: 1).each do |q|
              qid = q["_id"].split('/')
              fleet = qid[0]
              time_no = qid[1].to_i
              values = q["value"]
              record = event_table.where(
                "ship = :s AND map = :m AND cell = :c AND level = :l AND rank = :r AND enemy = :e AND time_no = :t",
                {
                  s: ship_id,
                  m: map_id,
                  c: cell_id,
                  l: level_no,
                  r: rank,
                  e: fleet,
                  t: time_no
                }
              ).first_or_create(
                ship: ship_id,
                map: map_id,
                cell: cell_id,
                level: level_no,
                rank: rank,
                enemy: fleet,
                time_no: time_no
              )
              record.count += values['count']
              record.hq_lv.merge!(Hash[values['hqLv'].map{|k, v| [k, v.to_i]}]) { |k, v1, v2| (v1 + v2) }
              record.origin.merge!(Hash[values['origin'].map{|k, v| [k, v.to_i]}]) { |k, v1, v2| (v1 + v2) }
              record.save
            end
          end
        end
      end
    end
  end
end

Sinatra::KVDataHelper.set_kv_data("migrate_drop", time_range[:to].to_s)

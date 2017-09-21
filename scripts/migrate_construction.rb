require_relative '../app'

time_range = {
  from: Time.parse(Sinatra::KVDataHelper.get_kv_data("migrate_construction")),
  to: CreateShipRecord.desc(:id).first.id.generation_time + 1
}

map_func = %Q{
  function() {
    val = {
      origin: {},
      hqLv: {},
      secretary: {},
      kdockId: {},
      count: NumberInt(1)
    }

    if (this.origin == null) return;
    if (this.teitokuLv == null) return;
    if (this.secretary == null) return;
    if (this.kdockId == null) return;
    if (this.items.length != 5) return;
    if (this.items[0] * this.items[1] * this.items[2] * this.items[3] * this.items[4] < 9000) return;

    var origin = this.origin.match(new RegExp(uaList.join('|')));
    if (origin == null) return;
    origin = origin[0].replace(/[ \.]/g, '_');
    val.origin[origin] = 1;
    val.secretary[this.secretary] = 1;
    val.hqLv[this.teitokuLv] = 1;
    val.kdockId[this.kdockId] = 1;

    var date = this._id.getTimestamp();
    var hour = date.getHours() * 10;
    var min = Math.floor(date.getMinutes() / 10);

    emit(this.items.join('-') + '-' + (hour + min).toString(), val);
  }
}

reduce_func = %Q{
  function(key, values) {
    var reduced = {
      origin: {},
      hqLv: {},
      secretary: {},
      kdockId: {},
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
      for(var s in value.secretary) {
        reduced.secretary[s] = reduced.secretary[s] || 0;
        reduced.secretary[s] += value.secretary[s];
      }
      for(var s in value.kdockId) {
        reduced.kdockId[s] = reduced.kdockId[s] || 0;
        reduced.kdockId[s] += value.kdockId[s];
      }
    });

    return reduced;
  }
}

CreateShipRecord.distinct(:shipId).to_a.each do |ship_id|
  next if ship_id.nil?
  puts "#{Time.now} #{ship_id}"
  CreateShipRecord.where(
    :id.gte => BSON::ObjectId.from_time(time_range[:from]),
    :id.lt  => BSON::ObjectId.from_time(time_range[:to]),
    :shipId => ship_id
  ).map_reduce(
    map_func,
    reduce_func
  ).scope(uaList: UAWhiteList.filters).out(inline: 1).each do |query|
    items = query['_id'].split('-').map(&:to_i)
    values = query['value']
    record = ConstructionRecord.where(
      "ship = :i AND cost = ARRAY[:c] AND time_no = :t",
      {
        i: ship_id,
        c: items.take(5),
        t: items.last
      }
    ).first_or_create(
      ship: ship_id,
      cost: items.take(5),
      time_no: items.last
    )
    record.count += values['count']
    record.secretary.merge!(Hash[values['secretary'].map{|k, v| [k, v.to_i]}]) { |k, v1, v2| (v1 + v2) }
    record.hq_lv.merge!(Hash[values['hqLv'].map{|k, v| [k, v.to_i]}]) { |k, v1, v2| (v1 + v2) }
    record.kdock.merge!(Hash[values['kdockId'].map{|k, v| [k, v.to_i]}]) { |k, v1, v2| (v1 + v2) }
    record.origin.merge!(Hash[values['origin'].map{|k, v| [k, v.to_i]}]) { |k, v1, v2| (v1 + v2) }
    record.save
  end
end

Sinatra::KVDataHelper.set_kv_data("migrate_construction", time_range[:to].to_s)

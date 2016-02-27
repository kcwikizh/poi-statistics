require_relative '../app'

time_range = {
  from: CreateItemRecord.asc(:id).first.id.generation_time,
  to: CreateItemRecord.desc(:id).first.id.generation_time
}

map_func = %Q{
  function() {
    val = {
      origin: {},
      hqLv: {},
      secretary: {},
      succ: this.successful,
      count: NumberInt(1)
    }

    var origin = this.origin.match(new RegExp(uaList.join('|')));
    if (origin == null) return;
    origin = origin[0].replace(/[ \.]/g, '_');
    val.origin[origin] = 1;
    val.secretary[this.secretary] = 1;
    val.hqLv[this.teitokuLv] = 1;

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
      succ: false,
      count: NumberInt(0)
    };

    values.forEach(function(value) {
      reduced.count += value.count;
      reduced.succ = value.succ;

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
    });

    return reduced;
  }
}

CreateItemRecord.distinct(:itemId).to_a.each do |item_id|
  puts item_id
  CreateItemRecord.where(
    :id.gte => BSON::ObjectId.from_time(time_range[:from]),
    :id.lt  => BSON::ObjectId.from_time(time_range[:to]),
    :itemId => item_id
  ).map_reduce(
    map_func,
    reduce_func
  ).scope(uaList: UAWhiteList.filters).out(inline: 1).each do |query|
    items = query['_id'].split('-').map(&:to_i)
    values = query['value']
    record = DevelopmentRecord.where(
      "name = :n AND item = :i AND cost = ARRAY[:c] AND time_no = :t",
      {
        n: Sinatra::DevelopmentQueryHelper.get_development_pool_name(time_range[:to]),
        i: item_id,
        c: items.take(4),
        t: items.last
      }
    ).first_or_create(
      name: Sinatra::DevelopmentQueryHelper.get_development_pool_name(time_range[:to]),
      item: item_id,
      cost: items.take(4),
      time_no: items.last,
      success: values['succ']
    )
    record.count += values['count']
    record.secretary.merge!(Hash[values['secretary'].map{|k, v| [k, v.to_i]}]) { |k, v1, v2| (v1 + v2) }
    record.hq_lv.merge!(Hash[values['hqLv'].map{|k, v| [k, v.to_i]}]) { |k, v1, v2| (v1 + v2) }
    record.origin.merge!(Hash[values['origin'].map{|k, v| [k, v.to_i]}]) { |k, v1, v2| (v1 + v2) }
    record.save
  end
end

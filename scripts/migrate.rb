require 'psych'
require 'mongoid'
require 'pathname'
require 'base64'
require 'parallel'
require 'sinatra/activerecord'

path = Pathname.new(File.dirname(__FILE__)).realpath.parent

Mongoid.load!("#{path}/config/mongoid.yml", :production)
Dir["#{path}/models/*.rb"].each { |file| load file }
Dir["#{path}/helpers/*.rb"].each { |file| load file }

Mongoid.logger.level = Logger::INFO
Mongo::Logger.logger.level = Logger::INFO

migrate_range = {
  from: Time.new(2019, 10, 29, 0, 0, 0),
  to: Time.now
}


  map_func = %Q{
    function() {
      if (!this.enemyFormation || !this.enemyShips1 || !this.enemyShips2 || !this.baseExp) return;
      var enemyShips = this.enemyShips1.concat(this.enemyShips2);
      if (!enemyShips.length) return;

      if (enemyShips.indexOf(0) > 0) return;

      val = {
        enemy: {}
      }

      var e = {
        count: 1,
        hqCount: {},
        originCount: {},
        baseExp: -1
      }
      e.hqCount[this.teitokuLv] = 1;
      e.originCount[this.origin] = 1;
      e.baseExp = this.baseExp;
      val.enemy[enemyShips.join('/') + '/' + this.enemyFormation] = e;

      if (this.shipId == 0) return;

      emit(this.shipId, val);
    }
  }

  reduce_func = %Q{
    function(key, values) {
      var reduced = {
        enemy: {}
      };

      values.forEach(function(value) {
        for(var e in value.enemy) {
          reduced.enemy[e] = reduced.enemy[e] || { count: 0, hqCount: {}, originCount: {}, baseExp: -1 };
          reduced.enemy[e].count += value.enemy[e].count;
          for(var lv in value.enemy[e].hqCount) {
            reduced.enemy[e].hqCount[lv] = reduced.enemy[e].hqCount[lv] || 0;
            reduced.enemy[e].hqCount[lv] += value.enemy[e].hqCount[lv];
          }
          for(var ua in value.enemy[e].originCount) {
            reduced.enemy[e].originCount[ua] = reduced.enemy[e].originCount[ua] || 0;
            reduced.enemy[e].originCount[ua] += value.enemy[e].originCount[ua];
          }
          reduced.enemy[e].baseExp = value.enemy[e].baseExp;
        }
      });

      return reduced;
    }
  }

  pool = {map: [],name: 'test'}
  pool[:map].each do |map_id|
    KanColleConstant.map[map_id][:cells].each do |cell_obj|
      cell_obj[:index].each do |cell_id|
        ['S', 'A', 'B', 'C', 'D', 'E'].each do |rank|
          DropShipRecord.where(
            :id.gte     => BSON::ObjectId.from_time(migrate_range[:from]),
            :id.lt      => BSON::ObjectId.from_time(migrate_range[:to]),
            :mapId      => map_id,
            :quest      => KanColleConstant.map[map_id][:name],
            :cellId     => cell_id,
            :enemy      => cell_obj[:name],
            :rank       => rank)
            .map_reduce(map_func, reduce_func)
            .out(inline: 1).each do |query|
              Parallel.each(query['value']['enemy'], :in_threads => 4) do |enemy|
                fleet = enemy[0].split('/').map(&:to_i)
                stat = DropShipStatistic.find_or_create_by(
                  name: pool[:name],
                  ship_id: query['_id'].to_i,
                  map_id: map_id,
                  cell_id: cell_id,
                  point_id: cell_obj[:point],
                  level_no: 0,
                  hour_no: 0,
                  minute_no: 0,
                  rank: rank,
                  enemy_fleet: fleet[0..-2],
                  enemy_formation: fleet.last,
                  baseExp: enemy[1]['baseExp'])
                stat.from_time = Time.now if stat.from_time.nil?
                stat.to_time = Time.now
                stat.count += enemy[1]['count'].to_i
                enemy[1]['hqCount'].each do |k, v|
                  stat.hq_count[k] ||= 0
                  stat.hq_count[k] += v.to_i
                end
                enemy[1]['originCount'].each do |k, v|
                  stat.origin_count[Base64.encode64(k)] ||= 0
                  stat.origin_count[Base64.encode64(k)] += v.to_i
                end
                stat.save
              end
            end
        end
      end
      puts "#{map_id}-#{cell_obj[:point]}"
    end
  end

  # event
  pool = {map: [461,462,463,464], name: 't'}
  pool[:map].each do |map_id|
    KanColleConstant.map[map_id][:cells].each do |cell_obj|
      cell_obj[:index].each do |cell_id|
        ['S', 'A', 'B', 'C', 'D', 'E'].each do |rank|
          (1..4).to_a.each do |level_no|
            next if map_id > 200 && level_no == 0
            next if map_id < 200 && level_no > 0

            DropShipRecord.where(
              :id.gte     => BSON::ObjectId.from_time(migrate_range[:from]),
              :id.lt      => BSON::ObjectId.from_time(migrate_range[:to]),
              :mapId      => map_id,
              :quest      => KanColleConstant.map[map_id][:name],
              :cellId     => cell_id,
              #:enemy      => cell_obj[:name],
              :mapLv      => level_no,
              :rank       => rank)
              .map_reduce(map_func, reduce_func)
              .out(inline: 1).each do |query|

                Parallel.each(query['value']['enemy'], :in_threads => 4) do |enemy|
                  fleet = enemy[0].split('/').map(&:to_i)
                  stat = DropShipStatistic.find_or_create_by(
                    name: pool[:name],
                    ship_id: query['_id'].to_i,
                    map_id: map_id,
                    cell_id: cell_id,
                    point_id: cell_obj[:point],
                    level_no: level_no,
                    hour_no: 0,
                    minute_no: 0,
                    rank: rank,
                    enemy_fleet: fleet[0..-2],
                    enemy_formation: fleet.last,
                    baseExp: enemy[1]['baseExp'])
                  stat.from_time = Time.now if stat.from_time.nil?
                  stat.to_time = Time.now
                  stat.count += enemy[1]['count'].to_i
                  enemy[1]['hqCount'].each do |k, v|
                    stat.hq_count[k] ||= 0
                    stat.hq_count[k] += v.to_i
                  end
                  enemy[1]['originCount'].each do |k, v|
                    stat.origin_count[Base64.encode64(k)] ||= 0
                    stat.origin_count[Base64.encode64(k)] += v.to_i
                  end
                  stat.save
                end
              end
          end
        end
      end
      puts "#{map_id}-#{cell_obj[:point]}"
    end
  end



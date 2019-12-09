require 'psych'
require 'mongoid'
require 'pathname'
require 'sinatra/activerecord'

path = Pathname.new(File.dirname(__FILE__)).realpath.parent

Mongoid.load!("#{path}/config/mongoid.yml", :production)
Dir["#{path}/models/*.rb"].each { |file| load file }

def staticify_wiki_drop(map_id, drop_pool_name)
  response = ''
  KanColleConstant.map[map_id][:cells].sort{|x, y| x[:point] <=> y[:point]}.each do |cell|
    drop_list = DropShipStatistic.where(
#      :name => drop_pool_name,
      :map_id => map_id,
      :point_id => cell[:point],
      :ship_id.gt => -1
    ).distinct(:ship_id).group_by do |x|
      next if x == 0
      if x == 486||x==516||x==561||x==596||x==625
        '驱逐舰'
      elsif x==574||x==604
        '轻巡洋舰'
      elsif x == 449 || x==448||x==595
        '重巡洋舰'
      elsif x == 423 || x==473||x==457||x==471||x==472||x==456||x==452||x==485||x==481||x==480||x==479||x==475||x==519||x==474||x==484||x==527||x==528||x==532||x==562||x==614||x==583
        '驱逐舰'
      elsif x == 483 || x==494 || x==162 || x==517 || x==518 || x==524||x==491||x==525||x==535||x==540||x==493||x==552||x==531||x==551||x==565||x==495||x==585||x==611||x==584||x==570
        '其他'
      elsif x == 444||x==521||x==515||x==433||x==534||x==544||x==549
        '空母类'
      elsif x == 439||x==492||x==511||x==440
        '战列舰'
      else
        p x if KCConstants.ships[x].nil?
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
    end

    flag = false
    r = "{{掉落表<br/> |海域点 =#{cell[:point]}<br/> |掉落 ="
    ['驱逐舰', '轻巡洋舰', '重巡洋舰', '战列舰', '空母类', '其他'].each do |type|
      next if !drop_list.include?(type)
      flag = true
      r += "'''#{type}'''："
      r += (drop_list[type].map do |i|
        ship = case i
          when 486
            '浦波'
          when 452
            '冲波'
when 423
'初月'
when 473
'春风'
when 457
'山风'
when 471
'神风'
when 472
'朝风'
when 456
'亲潮'
when 449
'波拉'
when 485
'藤波'
when 481
'水无月'
when 483
'伊26'
when 494
'伊13'
when 162
  '神威'
when 480
  '狭雾'
when 479
  '天雾'
when 491
  '塔斯特司令官'
when 444
  '鹫座'
when 448
  '扎拉'
when 525
  '松轮'
  when 535
  '路易吉·托雷利'
  when 439
  '厌战'
  when 475
    '旗风'
    when 492
      '黎塞留'
      when 515
        '皇家方舟'
        when 519
          '贾维斯'
          when 552
            '大东'
            when 474
              '松风'
              when 484
                '滨波'
                when 531
                  '佐渡'
                  when 511
                    '甘古特'
                    when 516
                      '塔什干'
                      when 433
                        '萨拉托加'
                        when 440
                          '衣阿华'
                        when 527
                          '岸波'
                        when 551
                          '日振'
                        when 574
                          '哥特兰'
                        when 565
                          '福江'
                        when 495
                          '伊14'
                        when 528
                          '早波'
                        when 532
                          '凉月'
                        when 562
                          '约翰斯顿'
                        when 585
                          '石垣'
                        when 534
                          '神鷹'
                        when 544
                          'Gambier Bay'
                        when 561
                          'Samuel B.Roberts'
                        when 596
                          'Fletcher'
                        when 549
                          'Intrepid'
                        when 611
                          '御藏'
                        when 614
                          '东北风'
                        when 583
                          '峰云'
                        when 584
                          '八丈'
                        when 604
                          '德·鲁伊特'
                        when 595
                          '休斯敦'
                        when 570
                          '平户'
                        when 625
                          '秋霜'
          else
            p i if KanColleConstant.ship[i].nil? 
            KanColleConstant.ship[i][:name]
          end
        info = case i
          when 486, 452,423,473,457,471,472,456,449,485,481,483,494,480,479,491,444,448,525,535,439,475,492,515,519,552,474,484,531,511,516,433,440,527,551,574,565,495,528,532,562,585,534,544,561,596,549,611,614,583,584,604,595,570,625
            ship
          else
            KCConstants.ship_infos[ship]
          end
        if info.is_a?(String)
          "{{稀有舰|#{ship}}}"
        elsif info[:rare]
          "{{稀有舰|#{info[:chinese_name]}}}"
        else
          "[[#{info[:chinese_name]}]]"
        end
      end).join('、')
      r += "&lt;br/&gt;"
    end
    r += "<br/>}}<br/>"

    response += r if flag
  end

  cache = StatisticCache.find_or_create_by(
    name: "2wiki-drop-#{map_id}"
  )
  cache.content = response
  cache.save
end

def staticify_wiki_enemy(map_id, drop_pool_name)
  result = ''
  map_func = %Q{
    function() {
      if (!this.baseExp) return;
      var val = {
        count: this.count,
        baseExp: this.baseExp,
        hq: [Math.min.apply(Math,Object.keys(this.hq_count).map(d=>parseInt(d))),Math.max.apply(Math,Object.keys(this.hq_count).map(d=>parseInt(d)))]
      }
      emit(this.enemy_fleet.join('/') + '/' + this.enemy_formation, val);
    }
  }
  reduce_func = %Q{
    function(key, values) {
      var reduced = {
        count: 0,
        hq: [999, 0],
        baseExp: -1
      };

      values.forEach(function(value) {
        reduced.count += value.count;
        if(value.hq[0]<reduced.hq[0]){
          reduced.hq[0]=value.hq[0]
        }
        if(value.hq[1]>reduced.hq[1]) {
          reduced.hq[1]=value.hq[1];
        }
        reduced.baseExp = value.baseExp;
      });

      return reduced;
    }
  }
  levels = []
  if map_id > 200
    levels = [4, 3, 2, 1]
  else
    levels = [0]
  end

  levels.each do |i|
    result += case i
      when 4
        "甲：<br/>"
      when 3
        "乙：<br/>"
      when 2
        "丙：<br/>"
      when 1
        "丁：<br/>"
      when 0
        ""
    end
    KanColleConstant.map[map_id][:cells].sort{|x, y| x[:point] <=> y[:point]}.each do |cell|
      new_json = {
        entryCount: 0,
        entries: [],
        name: cell[:name]
      }

      count = 1
      result += %Q({{敌方配置表<br/>   |海域点       =#{cell[:point]}<br/>   |海域点原名   =#{cell[:name]}<br/>   |海域点译名   =<br/>   |nodetype=<br/>)
      sum = DropShipStatistic.where(
        :map_id => map_id,
        :point_id => cell[:point],
        :level_no => i
      ).sum(:count)
      enemy_form = {}
      DropShipStatistic.where(
        :map_id => map_id,
        :point_id => cell[:point],
        :level_no => i
      ).map_reduce(map_func, reduce_func).out(inline: 1).each do |q|
        if (sum > 1000 && q['value']['count'].to_f / sum > 0.001) || sum <= 1000
          data = q['_id'].split('/').map(&:to_i)
          enemy_form[data[0..-2].join('-')] ||= []
          enemy_form[data[0..-2].join('-')].push(data[-1])

          new_json_item = {
            formation: data[-1].to_i,
            exp: q['value']['baseExp'].to_i
          }
          if data[0..-2].length > 7
            new_json_item['mainFleet'] = data[0..-2][0..5].map{|s| { id: s.to_i }}
            new_json_item['escortFleet'] = data[0..-2][6..-1].map{|s| { id: s.to_i }}
          else
            new_json_item['mainFleet'] = data[0..-2][0..-1].map{|s| { id: s.to_i }}
            new_json_item['escortFleet'] = []
          end
          new_json[:entryCount] += 1
          new_json[:entries].push(new_json_item)

          next if enemy_form[data[0..-2].join('-')].count > 1
          result += "   |阵型#{count == 1 ? " " : "#{count}"}=ZHENXING_#{data[0..-2].join('-')}<br/>"
          result += "   |敌方#{count == 1 ? " " : "#{count}"}="
          ship_idx = 0
          data[0..-2].each do |d|
            next if d == -1
            ship_idx += 1
              if ship_idx == 7
                result += "&lt;br>"
              end
            result += "{{深海横幅|#{d}}}"
          end
          result += "<br/>"
          result += "   |制空值#{count == 1 ? " " : "#{count}"}= <br>"
          result += "   |获得经验#{count == 1 ? " " : "#{count}"}="+q['value']['baseExp'].to_i.to_s+"<br>"
          count += 1

        else p cell[:point]; p sum; p q['value']['count'];p q['_id']
        end
      end
      result += "}}<br/>"
      enemy_form.each do |key_e, v_e|
        result.sub!('ZHENXING_'+key_e, v_e.map{|e| KanColleConstant.formation[e]}.join('&lt;br>'))
      end

      cache22 = StatisticCache.find_or_create_by(
        name: "22wiki-enemy-#{map_id}-#{cell[:point]}-#{i}"
      )
      cache22.content = JSON.dump(new_json)
      cache22.save
    end
    result += "<br/>"
  end

  cache = StatisticCache.find_or_create_by(
    name: "2wiki-enemy-#{map_id}"
  )
  cache.content = result
  cache.save
end

pool = {map: [465,466], name: 'test'}
pool[:map].each do |map_id|
  staticify_wiki_drop(map_id, pool[:name])
  puts "wiki-drop-#{map_id}"
  staticify_wiki_enemy(map_id, pool[:name])
  puts "wiki-enemy-#{map_id}"
end

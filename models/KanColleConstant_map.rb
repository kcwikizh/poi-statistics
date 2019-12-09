require 'json'

class KanColleConstant
  @data = JSON.parse(File.read("#{File.dirname(__FILE__)}/../data/map.json"))

  @@map = {
    11 => {
      :name => "鎮守府正面海域",
      :cells => [
        {
          :name => "敵偵察艦",
          :point => :A,
          :index => [1],
        },
        {
          :name => "敵はぐれ艦隊",
          :point => :B,
          :index => [2],
        },
        {
          :name => "敵主力艦隊",
          :point => :C,
          :index => [3],
          :boss => true,
        },
      ],
      :map => "MapHD1-1.png"
    },
    12 => {
      :name => "南西諸島沖",
      :cells => [
        {
          :name => "敵前衛艦隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "",
          :point => :B,
          :index => [2],
          :event => 2,
        },
        {
          :name => "敵前衛艦隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "敵水雷戦隊",
          :point => :D,
          :index => [4],
        },
        {
          :name => "敵主力艦隊",
          :point => :E,
          :index => [5, 6],
          :boss => true,
        },
      ],
      :map => "MapHD1-2.png"
    },
    13 => {
      :name => "製油所地帯沿岸",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1],
          :event => 1,
        },
        {
          :name => "",
          :point => :B,
          :index => [2],
          :event => 1,
        },
        {
          :name => "敵前衛艦隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "",
          :point => :D,
          :index => [4],
          :event => 2,
        },
        {
          :name => "敵前衛艦隊",
          :point => :E,
          :index => [5, 11],
        },
        {
          :name => "敵支援艦隊",
          :point => :F,
          :index => [6, 12],
        },
        {
          :name => "",
          :point => :G,
          :index => [7],
          :event => 2,
        },
        {
          :name => "",
          :point => :H,
          :index => [8],
          :event => 3,
        },
        {
          :name => "",
          :point => :I,
          :index => [9],
          :event => 1,
        },
        {
          :name => "敵主力艦隊",
          :point => :J,
          :index => [10, 13],
          :boss => true,
        },
      ],
      :map => "MapHD1-3.png"
    },
    14 => {
      :name => "南西諸島防衛線",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1],
          :event => 1,
        },
        {
          :name => "敵偵察艦隊",
          :point => :B,
          :index => [2],
        },
        {
          :name => "",
          :point => :C,
          :index => [3],
          :event => 2,
        },
        {
          :name => "敵偵察艦隊",
          :point => :D,
          :index => [4, 13],
        },
        {
          :name => "",
          :point => :E,
          :index => [5, 14],
          :event => 2,
        },
        {
          :name => "",
          :point => :F,
          :index => [6],
          :event => 1,
        },
        {
          :name => "",
          :point => :G,
          :index => [7],
          :event => 2,
        },
        {
          :name => "敵前衛任務部隊 I群",
          :point => :H,
          :index => [8, 15],
        },
        {
          :name => "敵前衛任務部隊 II群",
          :point => :I,
          :index => [9],
        },
        {
          :name => "敵支援打撃任務群",
          :point => :J,
          :index => [10],
        },
        {
          :name => "",
          :point => :K,
          :index => [11],
          :event => 1,
        },
        {
          :name => "敵機動部隊",
          :point => :L,
          :index => [12, 16, 17],
          :boss => true,
        },
      ],
      :map => "MapHD1-4.png"
    },
    15 => {
      :name => "鎮守府近海",
      :cells => [
        {
          :name => "敵偵察潜水艦",
          :point => :A,
          :index => [1],
        },
        {
          :name => "",
          :point => :B,
          :index => [2],
          :event => 1,
        },
        {
          :name => "敵通商破壊高速水上艦隊 A群",
          :point => :C,
          :index => [3],
        },
        {
          :name => "敵潜水艦隊B群",
          :point => :D,
          :index => [4],
        },
        {
          :name => "敵潜水艦隊C群",
          :point => :E,
          :index => [5],
        },
        {
          :name => "敵潜水艦隊A群",
          :point => :F,
          :index => [6],
        },
        {
          :name => "",
          :point => :G,
          :index => [7],
          :event => 1,
        },
        {
          :name => "敵通商破壊高速水上艦隊 B群",
          :point => :H,
          :index => [8],
        },
        {
          :name => "敵侵攻機動部隊",
          :point => :I,
          :index => [9],
        },
        {
          :name => "敵通商破壊主力潜水艦隊",
          :point => :J,
          :index => [10, 11, 12],
          :boss => true,
        },
      ],
      :map => "MapHD1-5.png"
    },
    16 => {
      :name => "鎮守府近海航路",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1],
          :event => 1,
        },
        {
          :name => "通商破壊潜水艦隊 II群",
          :point => :C,
          :index => [2],
        },
        {
          :name => "通商破壊潜水艦隊 III群",
          :point => :E,
          :index => [3],
        },
        {
          :name => "",
          :point => :G,
          :index => [4],
          :event => 2,
        },
        {
          :name => "",
          :point => :H,
          :index => [5],
          :event => 1,
        },
        {
          :name => "任務部隊支援 水上打撃部隊",
          :point => :K,
          :index => [6, 15],
        },
        {
          :name => "",
          :point => :M,
          :index => [7],
          :event => 2,
        },
        {
          :name => "任務部隊A群 機動部隊(第一波)",
          :point => :L,
          :index => [8],
          :event => 7,
        },
        {
          :name => "任務部隊A群 機動部隊本隊",
          :point => :J,
          :index => [9],
        },
        {
          :name => "通商破壊潜水艦隊 I群",
          :point => :I,
          :index => [10],
        },
        {
          :name => "任務部隊A群 機動部隊(第二波)",
          :point => :D,
          :index => [11, 16],
          :event => 7,
        },
        {
          :name => "任務部隊C群 機動部隊",
          :point => :F,
          :index => [12],
          :event => 7,
        },
        {
          :name => "任務部隊C群 前衛部隊",
          :point => :B,
          :index => [13],
        },
        {
          :name => "",
          :point => :N,
          :index => [14, 17],
          :event => 8,
        },
      ],
      :map => "MapHD1-6.png"
    },
    21 => {
      :name => "南西諸島近海",
      :cells => [
        {
          :name => "敵上陸船団",
          :point => :A,
          :index => [1],
        },
        {
          :name => "",
          :point => :B,
          :index => [2],
          :event => 2,
        },
        {
          :name => "敵前衛部隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "敵護衛空母群",
          :point => :D,
          :index => [4, 9],
        },
        {
          :name => "",
          :point => :E,
          :index => [5],
          :event => 2,
        },
        {
          :name => "敵機動部隊群",
          :point => :F,
          :index => [6],
        },
        {
          :name => "",
          :point => :G,
          :index => [7],
          :event => 1,
        },
        {
          :name => "敵主力艦隊",
          :point => :H,
          :index => [8, 10, 11],
          :boss => true,
        },
      ],
      :map => "MapHD2-1.png"
    },
    22 => {
      :name => "バシー海峡",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1],
          :event => 2,
        },
        {
          :name => "敵上陸船団",
          :point => :B,
          :index => [2],
        },
        {
          :name => "",
          :point => :C,
          :index => [3],
          :event => 1,
        },
        {
          :name => "敵上陸船団",
          :point => :D,
          :index => [4],
        },
        {
          :name => "敵水雷戦隊",
          :point => :E,
          :index => [5],
        },
        {
          :name => "",
          :point => :F,
          :index => [6],
          :event => 2,
        },
        {
          :name => "敵水上打撃部隊",
          :point => :G,
          :index => [7],
        },
        {
          :name => "",
          :point => :H,
          :index => [8, 12],
          :event => 1,
        },
        {
          :name => "",
          :point => :I,
          :index => [9],
          :event => 1,
        },
        {
          :name => "",
          :point => :J,
          :index => [10],
          :event => 2,
        },
        {
          :name => "敵通商破壊機動部隊 主力艦隊",
          :point => :K,
          :index => [11, 13, 14],
          :boss => true,
        },
      ],
      :map => "MapHD2-2.png"
    },
    23 => {
      :name => "東部オリョール海",
      :cells => [
        {
          :name => "敵前衛警戒部隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "",
          :point => :B,
          :index => [2],
          :event => 1,
        },
        {
          :name => "",
          :point => :C,
          :index => [3],
          :event => 1,
        },
        {
          :name => "",
          :point => :D,
          :index => [4, 15],
          :event => 2,
        },
        {
          :name => "敵前衛警戒部隊",
          :point => :E,
          :index => [5],
        },
        {
          :name => "敵水雷戦隊",
          :point => :F,
          :index => [6, 16, 17],
        },
        {
          :name => "",
          :point => :G,
          :index => [7, 18],
          :event => 2,
        },
        {
          :name => "",
          :point => :H,
          :index => [8],
          :event => 2,
        },
        {
          :name => "",
          :point => :I,
          :index => [9],
          :event => 2,
        },
        {
          :name => "敵巡洋艦戦隊",
          :point => :J,
          :index => [10],
        },
        {
          :name => "敵巡洋艦戦隊",
          :point => :K,
          :index => [11, 19],
        },
        {
          :name => "",
          :point => :L,
          :index => [12],
          :event => 1,
        },
        {
          :name => "敵揚陸艦隊",
          :point => :M,
          :index => [13],
        },
        {
          :name => "敵主力打撃群",
          :point => :N,
          :index => [14, 20],
          :boss => true,
        },
      ],
      :map => "MapHD2-3.png"
    },
    24 => {
      :name => "沖ノ島海域",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1],
          :event => 2,
        },
        {
          :name => "敵前衛巡洋艦戦隊",
          :point => :B,
          :index => [2],
        },
        {
          :name => "",
          :point => :C,
          :index => [3],
          :event => 3,
        },
        {
          :name => "",
          :point => :D,
          :index => [4],
          :event => 2,
        },
        {
          :name => "敵侵攻高速軽快部隊",
          :point => :E,
          :index => [5],
        },
        {
          :name => "前衛機動部隊",
          :point => :F,
          :index => [6],
        },
        {
          :name => "",
          :point => :G,
          :index => [7, 17],
          :event => 2,
        },
        {
          :name => "",
          :point => :H,
          :index => [8],
          :event => 1,
        },
        {
          :name => "敵精鋭水雷戦隊",
          :point => :I,
          :index => [9],
        },
        {
          :name => "",
          :point => :J,
          :index => [10],
          :event => 1,
        },
        {
          :name => "",
          :point => :K,
          :index => [11],
          :event => 1,
        },
        {
          :name => "敵機動部隊 B群",
          :point => :L,
          :index => [12, 18, 19],
        },
        {
          :name => "敵機動部隊 A群",
          :point => :M,
          :index => [13, 20],
        },
        {
          :name => "",
          :point => :N,
          :index => [14],
          :event => 2,
        },
        {
          :name => "",
          :point => :O,
          :index => [15],
          :event => 1,
        },
        {
          :name => "敵侵攻中核水上打撃部隊",
          :point => :P,
          :index => [16, 21],
          :boss => true,
        },
      ],
      :map => "MapHD2-4.png"
    },
    25 => {
      :name => "沖ノ島沖",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1],
          :event => 1,
        },
        {
          :name => "敵侵攻前衛艦隊 B群",
          :point => :B,
          :index => [2],
        },
        {
          :name => "敵侵攻前衛艦隊 A群",
          :point => :C,
          :index => [3],
        },
        {
          :name => "",
          :point => :D,
          :index => [4],
          :event => 1,
        },
        {
          :name => "敵侵攻重巡戦隊",
          :point => :E,
          :index => [5, 16],
        },
        {
          :name => "敵侵攻水雷戦隊",
          :point => :F,
          :index => [6],
        },
        {
          :name => "",
          :point => :G,
          :index => [7],
          :event => 3,
        },
        {
          :name => "",
          :point => :H,
          :index => [8, 17],
          :event => 1,
        },
        {
          :name => "",
          :point => :I,
          :index => [9, 18],
          :event => 1,
        },
        {
          :name => "敵侵攻水上打撃部隊",
          :point => :J,
          :index => [10],
        },
        {
          :name => "",
          :point => :K,
          :index => [11],
          :event => 1,
        },
        {
          :name => "敵侵攻機動部隊",
          :point => :L,
          :index => [12],
        },
        {
          :name => "",
          :point => :M,
          :index => [13],
          :event => 2,
        },
        {
          :name => "",
          :point => :N,
          :index => [14],
          :event => 2,
        },
        {
          :name => "敵侵攻中核艦隊",
          :point => :O,
          :index => [15, 19, 20],
          :boss => true,
        },
      ],
      :map => "MapHD2-5.png"
    },
    31 => {
      :name => "モーレイ海",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1],
          :event => 2,
        },
        {
          :name => "敵哨戒艦隊",
          :point => :B,
          :index => [2],
        },
        {
          :name => "敵通商破壊侵入水雷戦隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "敵北方支援任務部隊",
          :point => :D,
          :index => [4],
        },
        {
          :name => "",
          :point => :E,
          :index => [5],
          :event => 1,
        },
        {
          :name => "敵北方任務部隊",
          :point => :F,
          :index => [6, 8],
        },
        {
          :name => "敵北方侵攻艦隊",
          :point => :G,
          :index => [7, 9],
          :boss => true,
        },
      ],
      :map => "MapHD3-1.png"
    },
    32 => {
      :name => "キス島沖",
      :cells => [
        {
          :name => "敵北方遊撃任務部隊",
          :point => :A,
          :index => [1, 13],
        },
        {
          :name => "",
          :point => :B,
          :index => [2],
          :event => 2,
        },
        {
          :name => "敵北方水雷戦隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "",
          :point => :D,
          :index => [4],
          :event => 1,
        },
        {
          :name => "",
          :point => :E,
          :index => [5],
          :event => 1,
        },
        {
          :name => "",
          :point => :F,
          :index => [6, 14, 15],
          :event => 1,
        },
        {
          :name => "",
          :point => :G,
          :index => [7],
          :event => 3,
        },
        {
          :name => "敵北方水上打撃艦隊",
          :point => :H,
          :index => [8],
        },
        {
          :name => "",
          :point => :I,
          :index => [9],
          :event => 2,
        },
        {
          :name => "敵北方攻撃任務群 先遣護衛戦隊",
          :point => :J,
          :index => [10],
        },
        {
          :name => "敵北方攻撃任務群 機動部隊",
          :point => :K,
          :index => [11],
        },
        {
          :name => "敵キス島包囲艦隊",
          :point => :L,
          :index => [12],
          :boss => true,
        },
      ],
      :map => "MapHD3-2.png"
    },
    33 => {
      :name => "アルフォンシーノ方面",
      :cells => [
        {
          :name => "敵前衛艦隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "敵北方巡洋艦戦隊 B群",
          :point => :B,
          :index => [2],
        },
        {
          :name => "",
          :point => :C,
          :index => [3],
          :event => 3,
        },
        {
          :name => "",
          :point => :D,
          :index => [4],
          :event => 2,
        },
        {
          :name => "敵北方護衛空母群",
          :point => :E,
          :index => [5],
        },
        {
          :name => "",
          :point => :F,
          :index => [6],
          :event => 3,
        },
        {
          :name => "敵北方機動部隊",
          :point => :G,
          :index => [7, 14, 15],
        },
        {
          :name => "",
          :point => :H,
          :index => [8],
          :event => 2,
        },
        {
          :name => "",
          :point => :I,
          :index => [9],
          :event => 1,
        },
        {
          :name => "",
          :point => :J,
          :index => [10],
          :event => 1,
        },
        {
          :name => "敵北方巡洋艦戦隊 A群",
          :point => :K,
          :index => [11],
        },
        {
          :name => "",
          :point => :L,
          :index => [12],
          :event => 1,
        },
        {
          :name => "敵深海北方泊地艦隊",
          :point => :M,
          :index => [13, 16, 17],
          :boss => true,
        },
      ],
      :map => "MapHD3-3.png"
    },
    34 => {
      :name => "北方海域全域",
      :cells => [
        {
          :name => "敵北方艦隊 哨戒部隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "敵北方艦隊 哨戒部隊",
          :point => :B,
          :index => [2, 17],
        },
        {
          :name => "敵北方艦隊 前衛部隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "",
          :point => :D,
          :index => [4],
          :event => 3,
        },
        {
          :name => "",
          :point => :E,
          :index => [5],
          :event => 2,
        },
        {
          :name => "",
          :point => :F,
          :index => [6],
          :event => 3,
        },
        {
          :name => "敵北方艦隊 機動部隊",
          :point => :G,
          :index => [7, 18, 19],
        },
        {
          :name => "敵北方艦隊 重水雷戦隊",
          :point => :H,
          :index => [8, 20],
        },
        {
          :name => "",
          :point => :I,
          :index => [9],
          :event => 1,
        },
        {
          :name => "",
          :point => :J,
          :index => [10, 21, 22],
          :event => 1,
        },
        {
          :name => "",
          :point => :K,
          :index => [11],
          :event => 2,
        },
        {
          :name => "",
          :point => :L,
          :index => [12],
          :event => 1,
        },
        {
          :name => "敵北方艦隊 泊地防衛部隊",
          :point => :M,
          :index => [13],
        },
        {
          :name => "敵北方艦隊 泊地防衛部隊",
          :point => :N,
          :index => [14],
        },
        {
          :name => "",
          :point => :O,
          :index => [15],
          :event => 2,
        },
        {
          :name => "深海棲艦 北方艦隊中枢",
          :point => :P,
          :index => [16, 23, 24],
          :boss => true,
        },
      ],
      :map => "MapHD3-4.png"
    },
    35 => {
      :name => "北方AL海域",
      :cells => [
        {
          :name => "北方前衛警戒部隊",
          :point => :B,
          :index => [1],
        },
        {
          :name => "",
          :point => :A,
          :index => [2],
          :event => 1,
        },
        {
          :name => "",
          :point => :C,
          :index => [3],
          :event => 1,
        },
        {
          :name => "北方派遣任務部隊",
          :point => :D,
          :index => [4],
        },
        {
          :name => "北方遊撃部隊",
          :point => :E,
          :index => [5, 12],
        },
        {
          :name => "北方増援部隊前衛A",
          :point => :F,
          :index => [6, 13],
        },
        {
          :name => "北方増援部隊前衛B",
          :point => :G,
          :index => [7],
        },
        {
          :name => "北方AL泊地",
          :point => :H,
          :index => [8, 14],
        },
        {
          :name => "",
          :point => :J,
          :index => [9],
          :event => 2,
        },
        {
          :name => "",
          :point => :I,
          :index => [10],
          :event => 1,
        },
        {
          :name => "北方増援部隊主力",
          :point => :K,
          :index => [11, 15],
          :boss => true,
        },
      ],
      :map => "MapHD3-5.png"
    },
    41 => {
      :name => "ジャム島沖",
      :cells => [
        {
          :name => "敵水雷戦隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "",
          :point => :B,
          :index => [2],
          :event => 2,
        },
        {
          :name => "敵哨戒艦隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "敵東方潜水艦隊 警戒隊",
          :point => :D,
          :index => [4, 11],
        },
        {
          :name => "敵増援強襲輸送船団",
          :point => :E,
          :index => [5],
        },
        {
          :name => "",
          :point => :F,
          :index => [6],
          :event => 1,
        },
        {
          :name => "東方艦隊 先遣戦艦部隊",
          :point => :G,
          :index => [7],
        },
        {
          :name => "敵深海連合巡洋艦戦隊",
          :point => :H,
          :index => [8, 12],
        },
        {
          :name => "",
          :point => :I,
          :index => [9],
          :event => 1,
        },
        {
          :name => "敵深海連合部隊 司令部艦隊",
          :point => :J,
          :index => [10, 13],
          :boss => true,
        },
      ],
      :map => "MapHD4-1.png"
    },
    42 => {
      :name => "カレー洋海域",
      :cells => [
        {
          :name => "敵東方前衛艦隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "敵潜水教導艦隊",
          :point => :B,
          :index => [2],
        },
        {
          :name => "敵東方艦隊 遊撃戦隊",
          :point => :C,
          :index => [3, 13],
        },
        {
          :name => "敵空母機動部隊",
          :point => :D,
          :index => [4],
        },
        {
          :name => "敵東方艦隊 遊撃戦隊分遣隊",
          :point => :E,
          :index => [5],
        },
        {
          :name => "",
          :point => :F,
          :index => [6],
          :event => 1,
        },
        {
          :name => "敵東方艦隊 上陸輸送船団",
          :point => :G,
          :index => [7, 14, 15],
        },
        {
          :name => "敵潜水哨戒部隊",
          :point => :H,
          :index => [8],
        },
        {
          :name => "",
          :point => :I,
          :index => [9],
          :event => 1,
        },
        {
          :name => "",
          :point => :J,
          :index => [10],
          :event => 2,
        },
        {
          :name => "",
          :point => :K,
          :index => [11],
          :event => 2,
        },
        {
          :name => "敵東方艦隊 強襲上陸主力艦隊",
          :point => :L,
          :index => [12, 16],
          :boss => true,
        },
      ],
      :map => "MapHD4-2.png"
    },
    43 => {
      :name => "リランカ島",
      :cells => [
        {
          :name => "敵東方潜水艦隊 哨戒分遣集団",
          :point => :A,
          :index => [1],
        },
        {
          :name => "",
          :point => :B,
          :index => [2],
          :event => 2,
        },
        {
          :name => "敵東方潜水艦隊 哨戒主力集団",
          :point => :C,
          :index => [3],
        },
        {
          :name => "敵東方哨戒艦隊 B群",
          :point => :D,
          :index => [4, 15, 16],
        },
        {
          :name => "",
          :point => :E,
          :index => [5],
          :event => 3,
        },
        {
          :name => "敵東方空母機動部隊",
          :point => :F,
          :index => [6],
        },
        {
          :name => "敵東方哨戒艦隊 A群",
          :point => :G,
          :index => [7, 17],
        },
        {
          :name => "敵東方空母機動部隊 分遣群",
          :point => :H,
          :index => [8, 18, 19],
        },
        {
          :name => "敵東方艦隊 増援戦艦部隊",
          :point => :I,
          :index => [9, 20],
        },
        {
          :name => "",
          :point => :J,
          :index => [10],
          :event => 2,
        },
        {
          :name => "",
          :point => :K,
          :index => [11],
          :event => 3,
        },
        {
          :name => "敵哨戒艦隊",
          :point => :L,
          :index => [12],
        },
        {
          :name => "",
          :point => :M,
          :index => [13],
          :event => 1,
        },
        {
          :name => "敵東方港湾基地",
          :point => :N,
          :index => [14, 21, 22],
          :boss => true,
        },
      ],
      :map => "MapHD4-3.png"
    },
    44 => {
      :name => "カスガダマ島",
      :cells => [
        {
          :name => "敵東方哨戒艦隊 A群",
          :point => :A,
          :index => [1, 12],
        },
        {
          :name => "敵東方哨戒艦隊 B群",
          :point => :B,
          :index => [2],
        },
        {
          :name => "",
          :point => :C,
          :index => [3, 13],
          :event => 2,
        },
        {
          :name => "",
          :point => :D,
          :index => [4],
          :event => 3,
        },
        {
          :name => "敵潜水艦哨戒線",
          :point => :E,
          :index => [5, 14],
        },
        {
          :name => "敵東方空母機動部隊",
          :point => :F,
          :index => [6],
        },
        {
          :name => "敵東方艦隊 新鋭戦艦戦隊",
          :point => :G,
          :index => [7],
        },
        {
          :name => "敵東方艦隊 残存部隊",
          :point => :H,
          :index => [8, 15],
        },
        {
          :name => "敵東方中枢艦隊 護衛戦隊",
          :point => :I,
          :index => [9, 16, 17],
        },
        {
          :name => "",
          :point => :J,
          :index => [10],
          :event => 2,
        },
        {
          :name => "敵東方中枢艦隊 旗艦",
          :point => :K,
          :index => [11],
          :boss => true,
        },
      ],
      :map => "MapHD4-4.png"
    },
    45 => {
      :name => "カレー洋リランカ島沖",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1],
          :event => 102,
        },
        {
          :name => "東洋方面潜水艦隊 哨戒線Cライン",
          :point => :B,
          :index => [2],
        },
        {
          :name => "",
          :point => :C,
          :index => [3],
          :event => 102,
        },
        {
          :name => "東洋方面潜水艦隊 哨戒線Bライン",
          :point => :D,
          :index => [4, 21, 22],
        },
        {
          :name => "東洋方面艦隊 威力偵察部隊",
          :point => :E,
          :index => [5],
        },
        {
          :name => "東洋方面潜水艦隊 哨戒線Aライン",
          :point => :F,
          :index => [6],
        },
        {
          :name => "東洋方面艦隊 威力偵察部隊",
          :point => :G,
          :index => [7],
        },
        {
          :name => "東洋方面艦隊 新編水上打撃部隊",
          :point => :H,
          :index => [8, 23, 24],
        },
        {
          :name => "",
          :point => :I,
          :index => [9],
          :event => 102,
        },
        {
          :name => "東洋方面艦隊 突撃水雷戦隊",
          :point => :J,
          :index => [10],
        },
        {
          :name => "深海東洋艦隊 機動部隊",
          :point => :K,
          :index => [11, 25],
        },
        {
          :name => "",
          :point => :L,
          :index => [12],
          :event => 1,
        },
        {
          :name => "",
          :point => :M,
          :index => [13, 26],
          :event => 1,
        },
        {
          :name => "東洋方面艦隊 後方兵站部隊",
          :point => :N,
          :index => [14, 27, 28, 29],
        },
        {
          :name => "深海東洋方面増援潜水艦隊",
          :point => :O,
          :index => [15],
        },
        {
          :name => "",
          :point => :P,
          :index => [16],
          :event => 1,
        },
        {
          :name => "",
          :point => :Q,
          :index => [17],
          :event => 1,
        },
        {
          :name => "",
          :point => :R,
          :index => [18],
          :event => 3,
        },
        {
          :name => "深海東洋方面増援艦隊",
          :point => :S,
          :index => [19],
        },
        {
          :name => "リランカ島港湾守備隊",
          :point => :T,
          :index => [20, 30, 31, 32],
          :boss => true,
        },
      ],
      :map => "MapHD4-5.png"
    },
    51 => {
      :name => "南方海域前面",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1],
          :event => 3,
        },
        {
          :name => "敵南方前衛哨戒艦隊",
          :point => :B,
          :index => [2],
        },
        {
          :name => "",
          :point => :C,
          :index => [3],
          :event => 2,
        },
        {
          :name => "敵南方空母機動部隊",
          :point => :D,
          :index => [4],
        },
        {
          :name => "敵潜水艦南方哨戒線",
          :point => :E,
          :index => [5, 11],
        },
        {
          :name => "敵南方任務部隊 B群",
          :point => :F,
          :index => [6],
        },
        {
          :name => "敵南方任務部隊 A群",
          :point => :G,
          :index => [7, 12],
        },
        {
          :name => "",
          :point => :H,
          :index => [8],
          :event => 2,
        },
        {
          :name => "",
          :point => :I,
          :index => [9],
          :event => 1,
        },
        {
          :name => "敵南方前線司令艦隊",
          :point => :J,
          :index => [10, 13],
          :boss => true,
        },
      ],
      :map => "MapHD5-1.png"
    },
    52 => {
      :name => "珊瑚諸島沖",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1],
          :event => 3,
        },
        {
          :name => "",
          :point => :B,
          :index => [2, 16],
          :event => 1,
        },
        {
          :name => "敵任務部隊 機動部隊",
          :point => :C,
          :index => [3],
          :event => 10,
        },
        {
          :name => "敵任務部隊 随伴部隊",
          :point => :D,
          :index => [4],
        },
        {
          :name => "敵任務部隊 機動部隊",
          :point => :E,
          :index => [5],
        },
        {
          :name => "敵任務部隊 機動部隊",
          :point => :F,
          :index => [6, 17],
        },
        {
          :name => "",
          :point => :G,
          :index => [7],
          :event => 2,
        },
        {
          :name => "",
          :point => :H,
          :index => [8],
          :event => 1,
        },
        {
          :name => "敵任務部隊 機動部隊本隊",
          :point => :I,
          :index => [9],
          :event => 7,
        },
        {
          :name => "",
          :point => :J,
          :index => [10],
          :event => 2,
        },
        {
          :name => "敵任務部隊 随伴護衛戦隊",
          :point => :K,
          :index => [11, 18],
        },
        {
          :name => "敵任務部隊 機動部隊",
          :point => :L,
          :index => [12, 19],
          :event => 10,
        },
        {
          :name => "",
          :point => :M,
          :index => [13],
          :event => 3,
        },
        {
          :name => "",
          :point => :N,
          :index => [14],
          :event => 3,
        },
        {
          :name => "敵任務部隊 機動部隊本隊",
          :point => :O,
          :index => [15, 20, 21],
          :boss => true,
        },
      ],
      :map => "MapHD5-2.png"
    },
    53 => {
      :name => "サブ島沖海域",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1],
          :event => 1,
        },
        {
          :name => "",
          :point => :B,
          :index => [2],
          :event => 1,
        },
        {
          :name => "敵鉄底海峡任務部隊 哨戒隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "",
          :point => :D,
          :index => [4, 18],
          :event => 1,
        },
        {
          :name => "",
          :point => :E,
          :index => [5, 19],
          :event => 1,
        },
        {
          :name => "",
          :point => :F,
          :index => [6],
          :event => 2,
        },
        {
          :name => "",
          :point => :G,
          :index => [7],
          :event => 1,
        },
        {
          :name => "",
          :point => :H,
          :index => [8],
          :event => 2,
        },
        {
          :name => "敵鉄底海峡任務部隊 重巡戦隊",
          :point => :I,
          :index => [9],
          :event => 402,
        },
        {
          :name => "敵任務部隊 前衛哨戒隊",
          :point => :J,
          :index => [10, 20],
          :event => 402,
        },
        {
          :name => "敵鉄底海峡任務部隊 増援艦隊",
          :point => :K,
          :index => [11, 21],
          :event => 402,
        },
        {
          :name => "",
          :point => :L,
          :index => [12],
          :event => 3,
        },
        {
          :name => "敵任務部隊 増援部隊",
          :point => :M,
          :index => [13],
        },
        {
          :name => "敵南方支援艦隊",
          :point => :N,
          :index => [14],
          :event => 402,
        },
        {
          :name => "",
          :point => :O,
          :index => [15, 22, 23],
          :event => 102,
        },
        {
          :name => "敵泊地投錨中 輸送船団",
          :point => :P,
          :index => [16],
          :event => 402,
        },
        {
          :name => "敵南方艦隊 旗艦",
          :point => :Q,
          :index => [17],
          :boss => true,
        },
      ],
      :map => "MapHD5-3.png"
    },
    54 => {
      :name => "サーモン海域",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1],
          :event => 1,
        },
        {
          :name => "",
          :point => :B,
          :index => [2],
          :event => 1,
        },
        {
          :name => "敵南方増援部隊 前方警戒艦隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "",
          :point => :D,
          :index => [4, 17],
          :event => 3,
        },
        {
          :name => "敵鉄底海峡哨戒隊",
          :point => :E,
          :index => [5, 18],
        },
        {
          :name => "深海水上打撃群",
          :point => :F,
          :index => [6, 19],
        },
        {
          :name => "敵南方増援部隊 機動部隊",
          :point => :G,
          :index => [7],
        },
        {
          :name => "敵鉄底海峡巡洋艦戦隊",
          :point => :H,
          :index => [8, 20],
        },
        {
          :name => "",
          :point => :I,
          :index => [9],
          :event => 2,
        },
        {
          :name => "敵泊地投錨中 輸送船団",
          :point => :J,
          :index => [10],
        },
        {
          :name => "",
          :point => :K,
          :index => [11],
          :event => 3,
        },
        {
          :name => "敵南方増援部隊 本隊",
          :point => :L,
          :index => [12, 21],
        },
        {
          :name => "",
          :point => :M,
          :index => [13],
          :event => 1,
        },
        {
          :name => "",
          :point => :N,
          :index => [14],
          :event => 1,
        },
        {
          :name => "",
          :point => :O,
          :index => [15],
          :event => 1,
        },
        {
          :name => "敵南方増援部隊 本隊",
          :point => :P,
          :index => [16, 22],
          :boss => true,
        },
      ],
      :map => "MapHD5-4.png"
    },
    55 => {
      :name => "サーモン海域北方",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1],
          :event => 1,
        },
        {
          :name => "深海南方潜水艦隊 哨戒線",
          :point => :B,
          :index => [2],
        },
        {
          :name => "敵哨戒水雷戦隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "",
          :point => :D,
          :index => [4],
          :event => 3,
        },
        {
          :name => "",
          :point => :E,
          :index => [5],
          :event => 2,
        },
        {
          :name => "",
          :point => :F,
          :index => [6],
          :event => 102,
        },
        {
          :name => "敵哨戒重巡戦隊",
          :point => :G,
          :index => [7],
          :event => 402,
        },
        {
          :name => "敵機動部隊 C群",
          :point => :H,
          :index => [8, 20],
        },
        {
          :name => "",
          :point => :I,
          :index => [9],
          :event => 1,
        },
        {
          :name => "敵機動部隊 B群",
          :point => :J,
          :index => [10],
        },
        {
          :name => "敵機動部隊 A群",
          :point => :K,
          :index => [11],
        },
        {
          :name => "",
          :point => :L,
          :index => [12, 21, 22],
          :event => 3,
        },
        {
          :name => "敵新鋭戦艦戦隊",
          :point => :M,
          :index => [13, 23],
          :event => 402,
        },
        {
          :name => "深海南方任務部隊 重水雷戦隊",
          :point => :N,
          :index => [14, 24],
        },
        {
          :name => "",
          :point => :O,
          :index => [15, 25],
          :event => 1,
        },
        {
          :name => "深海南方任務部隊 水上打撃群",
          :point => :P,
          :index => [16, 26, 27],
        },
        {
          :name => "",
          :point => :Q,
          :index => [17],
          :event => 1,
        },
        {
          :name => "",
          :point => :R,
          :index => [18],
          :event => 1,
        },
        {
          :name => "深海南方任務部隊 本隊",
          :point => :S,
          :index => [19, 28],
          :boss => true,
        },
      ],
      :map => "MapHD5-5.png"
    },
    61 => {
      :name => "中部海域哨戒線",
      :cells => [
        {
          :name => "",
          :point => :B,
          :index => [1],
          :event => 1,
        },
        {
          :name => "",
          :point => :A,
          :index => [2],
          :event => 1,
        },
        {
          :name => "中部海域 敵遊撃部隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "中部海域哨戒戦 D地点",
          :point => :D,
          :index => [4],
        },
        {
          :name => "中部海域哨戒戦 F地点",
          :point => :F,
          :index => [5, 12, 13],
        },
        {
          :name => "",
          :point => :G,
          :index => [6],
          :event => 1,
        },
        {
          :name => "敵機動部隊",
          :point => :I,
          :index => [7],
        },
        {
          :name => "中部海域哨戒戦 H地点",
          :point => :H,
          :index => [8],
        },
        {
          :name => "",
          :point => :E,
          :index => [9],
          :event => 1,
        },
        {
          :name => "中部海域 敵輸送船団",
          :point => :J,
          :index => [10],
        },
        {
          :name => "敵回航中空母",
          :point => :K,
          :index => [11],
          :boss => true,
        },
      ],
      :map => "MapHD6-1.png"
    },
    62 => {
      :name => "MS諸島沖",
      :cells => [
        {
          :name => "敵攻略支援部隊A群",
          :point => :B,
          :index => [1],
        },
        {
          :name => "敵攻略支援部隊B群",
          :point => :C,
          :index => [2, 12],
        },
        {
          :name => "",
          :point => :A,
          :index => [3],
          :event => 1,
        },
        {
          :name => "",
          :point => :D,
          :index => [4, 13],
          :event => 3,
        },
        {
          :name => "敵空母機動部隊",
          :point => :F,
          :index => [5, 14],
        },
        {
          :name => "",
          :point => :E,
          :index => [6],
          :event => 1,
        },
        {
          :name => "敵高速水上打撃部隊",
          :point => :H,
          :index => [7],
        },
        {
          :name => "",
          :point => :G,
          :index => [8, 15],
          :event => 1,
        },
        {
          :name => "敵任務部隊B群",
          :point => :I,
          :index => [9, 16],
        },
        {
          :name => "敵任務部隊A群",
          :point => :J,
          :index => [10],
        },
        {
          :name => "敵攻略部隊本体",
          :point => :K,
          :index => [11, 17, 18],
          :boss => true,
        },
      ],
      :map => "MapHD6-2.png"
    },
    63 => {
      :name => "グアノ環礁沖海域",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1],
          :event => 102,
        },
        {
          :name => "泊地哨戒線",
          :point => :B,
          :index => [2],
        },
        {
          :name => "深海潜水艦隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "深海ピケット艦隊",
          :point => :D,
          :index => [4],
        },
        {
          :name => "深海哨戒水雷戦隊",
          :point => :E,
          :index => [5, 11],
        },
        {
          :name => "深海中部水上打撃群",
          :point => :F,
          :index => [6],
        },
        {
          :name => "",
          :point => :G,
          :index => [7],
          :event => 9,
        },
        {
          :name => "",
          :point => :H,
          :index => [8, 12],
          :event => 9,
        },
        {
          :name => "",
          :point => :I,
          :index => [9],
          :event => 1,
        },
        {
          :name => "留守泊地旗艦艦隊",
          :point => :J,
          :index => [10],
          :boss => true,
        },
      ],
      :map => "MapHD6-3.png"
    },
    64 => {
      :name => "中部北海域ピーコック島沖",
      :cells => [
        {
          :name => "中部海域哨戒水雷戦隊 A群",
          :point => :A,
          :index => [1],
        },
        {
          :name => "中部海域哨戒水雷戦隊 B群",
          :point => :B,
          :index => [2],
        },
        {
          :name => "離島防衛低速戦艦部隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "離島陸上航空隊",
          :point => :D,
          :index => [4, 15, 16, 17],
          :event => 10,
        },
        {
          :name => "中部海域哨戒遊撃部隊",
          :point => :E,
          :index => [5],
        },
        {
          :name => "離島陸上航空隊",
          :point => :F,
          :index => [6],
          :event => 10,
        },
        {
          :name => "離島陸上航空隊",
          :point => :G,
          :index => [7],
          :event => 10,
        },
        {
          :name => "離島防衛低速戦艦部隊",
          :point => :H,
          :index => [8],
        },
        {
          :name => "離島混成航空隊",
          :point => :I,
          :index => [9, 19],
          :event => 10,
        },
        {
          :name => "任務部隊 I群",
          :point => :J,
          :index => [10, 18],
        },
        {
          :name => "任務部隊 II群",
          :point => :K,
          :index => [11],
        },
        {
          :name => "増援護衛空母部隊",
          :point => :L,
          :index => [12],
        },
        {
          :name => "中部海域潜水哨戒線",
          :point => :M,
          :index => [13],
        },
        {
          :name => "離島守備隊",
          :point => :N,
          :index => [14, 20, 21],
          :boss => true,
        },
      ],
      :map => "MapHD6-4.png"
    },
    65 => {
      :name => "KW環礁沖海域",
      :cells => [
        {
          :name => "先遣任務部隊 前衛艦隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "深海潜水艦隊 前方展開部隊",
          :point => :B,
          :index => [2],
        },
        {
          :name => "先遣任務部隊",
          :point => :C,
          :index => [3, 14],
        },
        {
          :name => "深海護衛空母部隊 B群",
          :point => :D,
          :index => [4],
        },
        {
          :name => "深海潜水艦隊 精鋭群狼部隊",
          :point => :E,
          :index => [5],
        },
        {
          :name => "深海巡洋艦戦隊",
          :point => :F,
          :index => [6],
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :G,
          :index => [7, 15],
          :event => 10,
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :H,
          :index => [8, 16],
          :event => 10,
        },
        {
          :name => "深海護衛空母部隊 A群",
          :point => :I,
          :index => [9, 17],
        },
        {
          :name => "深海護衛空母部隊 C群",
          :point => :J,
          :index => [10],
          :event => 402,
        },
        {
         :name => "",
         :point => :K,
         :index => [11],
         :event => 1,
        },
        {
         :name => "",
         :point => :L,
         :index => [12],
         :event => 1,
        },
        {
          :name => "任務部隊 主力群",
          :point => :M,
          :index => [13, 18],
          :boss => true,
        },
      ],
      :map => "MapHD6-5.png"
    },
    71 => {
      :name => "ブルネイ泊地沖",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1],
          :event => 3,
        },
        {
          :name => "敵通商破壊侵入艦隊",
          :point => :B,
          :index => [2],
        },
        {
          :name => "敵通商破壊侵入 高速機動部隊",
          :point => :C,
          :index => [3, 12, 13],
        },
        {
          :name => "深海潜水艦隊 II群",
          :point => :D,
          :index => [4],
        },
        {
          :name => "",
          :point => :E,
          :index => [5, 14],
          :event => 2,
        },
        {
          :name => "深海潜水艦隊 III群",
          :point => :F,
          :index => [6],
        },
        {
          :name => "敵哨戒部隊",
          :point => :G,
          :index => [7, 15],
        },
        {
          :name => "深海潜水艦隊 I群",
          :point => :H,
          :index => [8],
        },
        {
          :name => "",
          :point => :I,
          :index => [9],
          :event => 2,
        },
        {
          :name => "",
          :point => :J,
          :index => [10],
          :event => 1,
        },
        {
         :name => "深海潜水艦隊集団 旗艦戦隊",
         :point => :K,
         :index => [11],
         :boss => true,
        },
      ],
      :map => "MapHD7-1.png"
    },
    72 => {
      :name => "タウイタウイ泊地沖",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1],
          :event => 3,
        },
        {
          :name => "深海任務部隊 前方侵入水雷戦隊",
          :point => :B,
          :index => [2, 8],
        },
        {
          :name => "セレベス海方面哨戒潜水艦 I群",
          :point => :C,
          :index => [3, 9],
        },
        {
          :name => "",
          :point => :D,
          :index => [4],
          :event => 1,
        },
        {
          :name => "セレベス海方面哨戒潜水艦 II群",
          :point => :E,
          :index => [5],
        },
        {
          :name => "",
          :point => :F,
          :index => [6],
          :event => 1,
        },
        {
          :name => "セレベス海方面 旗艦哨戒潜水艦",
          :point => :G,
          :index => [7],
        },
        {
          :name => "深海任務部隊 主力機動部隊群",
          :point => :H,
          :index => [10],
          :event => 7,
        },
        {
          :name => "深海任務部隊 前衛哨戒群",
          :point => :I,
          :index => [11, 16],
        },
        {
          :name => "深海任務部隊 強襲揚陸部隊群",
          :point => :J,
          :index => [12],
        },
        {
         :name => "",
         :point => :K,
         :index => [13],
         :event => 2,
        },
        {
         :name => "",
         :point => :L,
         :index => [14],
         :event => 1,
        },
        {
         :name => "深海任務部隊 主力機動部隊群",
         :point => :M,
         :index => [15],
         :boss => true,
        },
      ],
      :map => "MapHD7-2.png"
    },
    311 => {
      :name => "ショートランド沖",
      :cells => [
        {
          :name => "ピケット艦隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "深海打撃任務部隊",
          :point => :B,
          :index => [2],
        },
        {
          :name => "前衛哨戒潜水艦B群",
          :point => :C,
          :index => [3],
        },
        {
          :name => "深海巡洋艦戦隊",
          :point => :E,
          :index => [5],
        },
        {
          :name => "前衛哨戒潜水艦A群",
          :point => :F,
          :index => [6],
        },
        {
          :name => "警戒艦隊旗艦",
          :point => :Z,
          :index => [8, 10],
          :boss => true,
        },
      ],
      :map => "MapE-1Summer2015.png"
    },
    312 => {
      :name => "ソロモン海",
      :cells => [
        {
          :name => "前衛艦隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "潜水艦哨戒線",
          :point => :B,
          :index => [2],
        },
        {
          :name => "水上打撃部隊I群",
          :point => :D,
          :index => [4],
        },
        {
          :name => "水上打撃部隊II群",
          :point => :E,
          :index => [5],
        },
        {
          :name => "任務部隊II群",
          :point => :F,
          :index => [6],
        },
        {
          :name => "ソロモン泊地輸送船団",
          :point => :G,
          :index => [7, 14],
        },
        {
          :name => "任務部隊I群",
          :point => :H,
          :index => [8, 15],
        },
        {
          :name => "任務部隊III群",
          :point => :J,
          :index => [10],
        },
        {
          :name => "ソロモン泊地投錨艦隊旗艦",
          :point => :Z,
          :index => [13, 17],
          :boss => true,
        },
      ],
      :map => "MapE-2Summer2015.png"
    },
    313 => {
      :name => "南太平洋海域",
      :cells => [
        {
          :name => "深海水雷艦隊",
          :point => :B,
          :index => [2],
        },
        {
          :name => "任務部隊哨戒艦隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "任務部隊III群",
          :point => :D,
          :index => [4, 13],
        },
        {
          :name => "任務部隊IV群",
          :point => :E,
          :index => [5, 14],
        },
        {
          :name => "任務支援部隊",
          :point => :G,
          :index => [7, 15],
        },
        {
          :name => "任務部隊II群",
          :point => :H,
          :index => [8],
        },
        {
          :name => "任務部隊I群",
          :point => :I,
          :index => [9],
        },
        {
          :name => "深海飛行場基地",
          :point => :X,
          :index => [11],
        },
        {
          :name => "深海任務部隊旗艦艦隊",
          :point => :Z,
          :index => [12, 16, 17],
          :boss => true,
        },
      ],
      :map => "MapE-3Summer2015.png"
    },
    314 => {
      :name => "アイアンボトムサウンド",
      :cells => [
        {
          :name => "哨戒潜水艦A群",
          :point => :A,
          :index => [1],
        },
        {
          :name => "哨戒潜水艦B群",
          :point => :B,
          :index => [2],
        },
        {
          :name => "任務部隊支隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "ソロモン方面守備艦隊前衛",
          :point => :E,
          :index => [5, 14],
        },
        {
          :name => "任務部隊前衛艦隊",
          :point => :F,
          :index => [6],
        },
        {
          :name => "ソロモン方面守備艦隊後衛",
          :point => :G,
          :index => [7],
        },
        {
          :name => "深海任務部隊主隊",
          :point => :H,
          :index => [8, 15, 16],
        },
        {
          :name => "深海任務部隊支援群",
          :point => :J,
          :index => [10],
        },
        {
          :name => "深海飛行場基地",
          :point => :Z,
          :index => [13, 18],
          :boss => true,
        },
      ],
      :map => "MapE-4Summer2015.png"
    },
    315 => {
      :name => "西方海域戦線 カレー洋",
      :cells => [
        {
          :name => "潜水艦哨戒線Aライン",
          :point => :A,
          :index => [1],
        },
        {
          :name => "深海東洋戦艦部隊",
          :point => :C,
          :index => [3, 15],
        },
        {
          :name => "深海水雷戦隊",
          :point => :E,
          :index => [5],
        },
        {
          :name => "東洋方面増援機動部隊B群",
          :point => :F,
          :index => [6, 16],
        },
        {
          :name => "東洋方面反攻拠点泊地",
          :point => :G,
          :index => [7],
        },
        {
          :name => "潜水艦哨戒線Bライン",
          :point => :H,
          :index => [8],
        },
        {
          :name => "東洋方面増援機動部隊A群",
          :point => :J,
          :index => [10],
        },
        {
          :name => "深海増援輸送船団",
          :point => :K,
          :index => [11, 17],
        },
        {
          :name => "東洋方面増援艦隊旗艦",
          :point => :Z,
          :index => [14],
          :boss => true,
        },
      ],
      :map => "MapE-5Summer2015.png"
    },
    316 => {
      :name => "ソロモン海東部海域",
      :cells => [
        {
          :name => "潜水哨戒艦隊II群",
          :point => :A,
          :index => [1],
        },
        {
          :name => "深海高速水雷戦隊",
          :point => :B,
          :index => [2],
        },
        {
          :name => "航空集団偵察部隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "深海航空集団支援打撃部隊",
          :point => :D,
          :index => [4],
        },
        {
          :name => "潜水哨戒艦隊I群",
          :point => :E,
          :index => [5, 18],
        },
        {
          :name => "前衛警戒任務部隊",
          :point => :F,
          :index => [6, 19, 20],
        },
        {
          :name => "深海航空集団D群",
          :point => :H,
          :index => [8],
        },
        {
          :name => "深海航空集団B群",
          :point => :K,
          :index => [11],
        },
        {
          :name => "深海航空集団C群",
          :point => :L,
          :index => [12, 21],
        },
        {
          :name => "深海航空集団A群",
          :point => :M,
          :index => [13],
        },
        {
          :name => "深海航空集団旗艦艦隊",
          :point => :Z,
          :index => [17, 22, 23],
          :boss => true,
        },
      ],
      :map => "MapE-6Summer2015.png"
    },
    317 => {
      :name => "FS方面海域",
      :cells => [
        {
          :name => "深海潜水艦防衛線Aライン",
          :point => :B,
          :index => [2],
        },
        {
          :name => "深海FS方面輸送船団",
          :point => :C,
          :index => [3],
        },
        {
          :name => "FS方面深海再編成部隊",
          :point => :E,
          :index => [5],
        },
        {
          :name => "深海潜水艦防衛線Bライン",
          :point => :F,
          :index => [6],
        },
        {
          :name => "深海潜水艦防衛線Cライン",
          :point => :I,
          :index => [9],
        },
        {
          :name => "FS方面残存航空集団B群",
          :point => :J,
          :index => [10, 21],
        },
        {
          :name => "FS方面残存航空集団C群",
          :point => :K,
          :index => [11],
        },
        {
          :name => "FS方面残存水上打撃部隊",
          :point => :L,
          :index => [12, 22],
        },
        {
          :name => "FS方面残存航空集団A群",
          :point => :M,
          :index => [13, 23],
        },
        {
          :name => "深海FS方面泊地防衛部隊",
          :point => :X,
          :index => [17],
        },
        {
          :name => "深海FS諸島防衛施設部隊",
          :point => :Y,
          :index => [18, 25],
        },
        {
          :name => "FS方面深海中枢艦隊",
          :point => :Z,
          :index => [19, 26],
          :boss => true,
        },
      ],
      :map => "MapE-7Summer2015.png"
    },
    321 => {
      :name => "ショートランド泊地沖",
      :cells => [
        {
          :name => "輸送任務部隊",
          :point => :A,
          :index => [1]
        },
        {
          :name => "前衛哨戒部隊",
          :point => :C,
          :index => [3, 11]
        },
        {
          :name => "警戒任務部隊",
          :point => :E,
          :index => [5]
        },
        {
          :name => "空母機動部隊",
          :point => :F,
          :index => [6, 12]
        },
        {
          :name => "水上打撃部隊",
          :point => :H,
          :index => [8, 13]
        },
        {
          :name => "前衛展開部隊旗艦",
          :point => :J,
          :index => [10, 14],
          :boss => true
        },
      ],
      :map => "MapE-1Autumn2015.png"
    },
    322 => {
      :name => "コロネハイカラ島沖",
      :cells => [
        {
          :name => "警戒任務群 前衛別働隊",
          :point => :B,
          :index => [2]
        },
        {
          :name => "警戒任務群 重巡戦隊",
          :point => :C,
          :index => [3]
        },
        {
          :name => "警戒任務群 前衛部隊",
          :point => :D,
          :index => [4]
        },
        {
          :name => "潜水艦警戒線",
          :point => :E,
          :index => [5, 12]
        },
        {
          :name => "警戒任務群 主力部隊",
          :point => :F,
          :index => [6, 13, 14]
        },
        {
          :name => "バニラ湾輸送部隊",
          :point => :G,
          :index => [8]
        },
        {
          :name => "警戒任務群 主力部隊増援",
          :point => :H,
          :index => [7]
        },
        {
          :name => "警戒任務群 旗艦艦隊",
          :point => :K,
          :index => [11, 17],
          :boss => true
        },
      ],
      :map => "MapE-2Autumn2015.png"
    },
    323 => {
      :name => "コロネハイカラ島東方沖",
      :cells => [
        {
          :name => "深海潜水艦隊",
          :point => :B,
          :index => [2]
        },
        {
          :name => "前衛警戒部隊",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海巡洋艦戦隊",
          :point => :D,
          :index => [4]
        },
        {
          :name => "高速魚雷艇部隊",
          :point => :E,
          :index => [5, 12]
        },
        {
          :name => "深海輸送船団",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海水上打撃部隊",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海任務部隊 旗艦艦隊",
          :point => :K,
          :index => [11],
          :boss => true
        },
      ],
      :map => "MapE-3Autumn2015.png"
    },
    324 => {
      :name => "西方海域戦線 ステビア海",
      :cells => [
        {
          :name => "前衛哨戒艦隊",
          :point => :B,
          :index => [2]
        },
        {
          :name => "潜水艦哨戒線B群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "潜水艦哨戒線A群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "空母機動部隊 II群",
          :point => :F,
          :index => [6, 17]
        },
        {
          :name => "空母機動部隊 III群",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海戦艦部隊",
          :point => :H,
          :index => [8]
        },
        {
          :name => "空母機動部隊 I群",
          :point => :I,
          :index => [9, 18]
        },
        {
          :name => "復旧中港湾施設",
          :point => :J,
          :index => [10]
        },
        {
          :name => "再建中秘匿泊地",
          :point => :M,
          :index => [13]
        },
        {
          :name => "増援東洋艦隊 前衛潜水艦隊",
          :point => :N,
          :index => [14]
        },
        {
          :name => "東洋艦隊 増援部隊 司令旗艦",
          :point => :O,
          :index => [15],
          :boss => true
        },
      ],
      :map => "MapE-4Autumn2015.png"
    },
    325 => {
      :name => "バニラ湾沖",
      :cells => [
        {
          :name => "潜水艦阻止線 Aライン哨戒前衛",
          :point => :B,
          :index => [2]
        },
        {
          :name => "潜水艦阻止線 Aライン",
          :point => :D,
          :index => [4]
        },
        {
          :name => "潜水艦阻止線 Bライン",
          :point => :F,
          :index => [6]
        },
        {
          :name => "輸送部隊迎撃部隊 前衛哨戒艦隊",
          :point => :G,
          :index => [7, 17]
        },
        {
          :name => "高速魚雷艇部隊",
          :point => :H,
          :index => [8]
        },
        {
          :name => "伏撃部隊 軽巡戦隊",
          :point => :I,
          :index => [9]
        },
        {
          :name => "伏撃部隊 精鋭駆逐隊",
          :point => :J,
          :index => [10, 18, 19]
        },
        {
          :name => "深海補給船団",
          :point => :L,
          :index => [12]
        },
        {
          :name => "伏撃部隊集団 旗艦",
          :point => :N,
          :index => [14],
          :boss => true
        },
      ],
      :map => "MapE-5Autumn2015.png"
    },
    331 => {
      :name => "カンパン湾沖",
      :cells => [
        {
          :name => "先遣哨戒潜水艦隊 II群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "先遣哨戒潜水艦隊 I群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "哨戒水雷戦隊 警戒部隊",
          :point => :D,
          :index => [4, 11]
        },
        {
          :name => "哨戒水雷戦隊 主力部隊",
          :point => :F,
          :index => [6, 12]
        },
        {
          :name => "陸上爆撃機隊 第2飛行中隊",
          :point => :G,
          :index => [7]
        },
        {
          :name => "陸上爆撃機隊 第1飛行中隊",
          :point => :H,
          :index => [8]
        },
        {
          :name => "哨戒任務戦隊 後方部隊",
          :point => :I,
          :index => [9]
        },
        {
          :name => "先遣哨戒潜水艦隊 旗艦艦隊",
          :point => :J,
          :index => [10],
          :boss => true
        },
      ],
      :map => "MapE-1Winter2016.png"
    },
    332 => {
      :name => "オートロ島マーマレード沖",
      :cells => [
        {
          :name => "潜水艦哨戒線 Aライン",
          :point => :A,
          :index => [1]
        },
        {
          :name => "潜水艦哨戒線 Bライン",
          :point => :B,
          :index => [2]
        },
        {
          :name => "潜水艦哨戒線 Cライン",
          :point => :C,
          :index => [3]
        },
        {
          :name => "陸上爆撃機隊 第4&第5飛行中隊",
          :point => :D,
          :index => [4]
        },
        {
          :name => "陸上爆撃機隊 第2飛行中隊",
          :point => :F,
          :index => [6, 16]
        },
        {
          :name => "深海迎撃任務部隊",
          :point => :G,
          :index => [7, 17]
        },
        {
          :name => "陸上爆撃機隊 第1飛行中隊",
          :point => :H,
          :index => [8]
        },
        {
          :name => "陸上爆撃機隊 第3飛行中隊",
          :point => :I,
          :index => [9]
        },
        {
          :name => "深海船団 間接護衛隊",
          :point => :J,
          :index => [10, 18]
        },
        {
          :name => "陸上爆撃機隊 戦爆連合",
          :point => :K,
          :index => [11]
        },
        {
          :name => "深海船団 警戒部隊",
          :point => :L,
          :index => [12, 19]
        },
        {
          :name => "警戒魚雷艇戦隊 I群",
          :point => :M,
          :index => [13, 20]
        },
        {
          :name => "警戒魚雷艇戦隊 II群",
          :point => :N,
          :index => [14]
        },
        {
          :name => "戦略補給物資集積地",
          :point => :O,
          :index => [15, 21],
          :boss => true
        },
      ],
      :map => "MapE-2Winter2016.png"
    },
    333 => {
      :name => "北海道北東沖",
      :cells => [
        {
          :name => "通商破壊潜水艦隊 A群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "先行侵入 通商破壊部隊",
          :point => :B,
          :index => [2]
        },
        {
          :name => "陸上爆撃機隊 渡洋爆撃",
          :point => :C,
          :index => [3]
        },
        {
          :name => "通商破壊潜水艦隊 B群",
          :point => :D,
          :index => [4, 21]
        },
        {
          :name => "侵攻部隊 火力支援部隊",
          :point => :E,
          :index => [5]
        },
        {
          :name => "侵攻部隊 潜水艦隊 I群",
          :point => :F,
          :index => [6, 25]
        },
        {
          :name => "任務部隊 空母機動部隊",
          :point => :H,
          :index => [8]
        },
        {
          :name => "陸上爆撃機隊 戦爆連合",
          :point => :I,
          :index => [9, 22]
        },
        {
          :name => "侵攻部隊 支援戦艦部隊",
          :point => :K,
          :index => [11]
        },
        {
          :name => "侵攻部隊 攻略部隊",
          :point => :L,
          :index => [12]
        },
        {
          :name => "侵攻部隊 巡洋艦戦隊",
          :point => :M,
          :index => [13]
        },
        {
          :name => "侵攻部隊 主力戦艦部隊",
          :point => :N,
          :index => [14]
        },
        {
          :name => "侵攻部隊 潜水艦隊 II群",
          :point => :P,
          :index => [16]
        },
        {
          :name => "陸上爆撃機隊 艦隊攻撃部隊",
          :point => :Q,
          :index => [17]
        },
        {
          :name => "侵攻先遣部隊 本隊",
          :point => :S,
          :index => [19],
          :boss => true
        },
        {
          :name => "侵攻部隊 旗艦艦隊",
          :point => :T,
          :index => [20, 23, 24],
          :boss => true
        },
      ],
      :map => "MapE-3Winter2016.png"
    },
    341 => {
      :name => "北太平洋前線海域",
      :cells => [
        {
          :name => "前衛水上打撃部隊 I群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "前衛警戒水雷戦隊",
          :point => :B,
          :index => [2]
        },
        {
          :name => "北太平洋潜水艦隊 II群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "前衛水上打撃部隊 II群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海重雷装戦隊",
          :point => :F,
          :index => [6]
        },
        {
          :name => "北太平洋潜水艦隊 I群",
          :point => :G,
          :index => [7, 13]
        },
        {
          :name => "深海島嶼防衛任務部隊",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海増援護衛船団",
          :point => :I,
          :index => [9]
        },
        {
          :name => "島嶼防衛艦隊旗艦",
          :point => :J,
          :index => [10],
          :boss => true
        },
        #{
        #  :name => "",
        #  :point => :K,
        #  :index => [11]
        #},
      ],
      :map => "MapE-1Spring2016.png"
    },
    342 => {
      :name => "北太平洋前線海域",
      :cells => [
        {
          :name => "警戒哨戒線",
          :point => :A,
          :index => [1]
        },
        {
          :name => "前衛空母任務部隊",
          :point => :B,
          :index => [2]
        },
        {
          :name => "潜水艦哨戒線",
          :point => :E,
          :index => [5, 13]
        },
        {
          :name => "上陸阻止ライン",
          :point => :F,
          :index => [6, 14]
        },
        {
          :name => "深海魚雷艇戦隊",
          :point => :G,
          :index => [7, 15]
        },
        {
          :name => "救援深海重巡戦隊",
          :point => :I,
          :index => [9]
        },
        {
          :name => "島嶼防衛要塞",
          :point => :J,
          :index => [10],
          :boss => true
        },
        #{
        #  :name => "",
        #  :point => :L,
        #  :index => [12]
        #}
      ],
      :map => "MapE-2Spring2016.png"
    },
    343 => {
      :name => "北太平洋前線海域",
      :cells => [
        {
          :name => "群狼潜水艦隊 C群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海基地航空隊 第2航空隊",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海第二水雷戦隊",
          :point => :D,
          :index => [4, 14, 15]
        },
        {
          :name => "群狼潜水艦隊 B群",
          :point => :E,
          :index => [5]
        },
        {
          :name => "深海第一水雷戦隊",
          :point => :F,
          :index => [6]
        },
        {
          :name => "群狼潜水艦隊 A群",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海基地航空隊 第1航空隊",
          :point => :I,
          :index => [9]
        },
        {
          :name => "魚雷艇突撃戦隊",
          :point => :J,
          :index => [10, 16, 17]
        },
        {
          :name => "深海駆逐隊旗艦",
          :point => :K,
          :index => [11],
          :boss => true
        },
        #{
        #  :name => "",
        #  :point => :L,
        #  :index => [12]
        #},
        #{
        #  :name => "",
        #  :point => :M,
        #  :index => [13]
        #},
      ],
      :map => "MapE-3Spring2016.png"
    },
    344 => {
      :name => "北太平洋前線海域",
      :cells => [
        {
          :name => "逆襲任務部隊 III群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "逆襲任務部隊 II群",
          :point => :C,
          :index => [3, 13]
        },
        {
          :name => "逆襲任務部隊 I群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "逆襲潜水艦隊 B群",
          :point => :E,
          :index => [5, 14]
        },
        {
          :name => "逆襲空母主力任務部隊",
          :point => :F,
          :index => [6, 15]
        },
        {
          :name => "逆襲前衛水雷戦隊",
          :point => :G,
          :index => [7]
        },
        {
          :name => "逆襲潜水艦隊 A群",
          :point => :H,
          :index => [8, 16]
        },
        {
          :name => "逆襲水上打撃部隊前衛部隊",
          :point => :I,
          :index => [9, 17]
        },
        {
          :name => "逆襲水上打撃部隊本隊",
          :point => :J,
          :index => [10]
        },
        {
          :name => "逆襲部隊旗艦艦隊",
          :point => :K,
          :index => [11, 18],
          :boss => true
        },
        #{
        #  :name => "",
        #  :point => :L,
        #  :index => [12, 19]
        #},
      ],
      :map => "MapE-4Spring2016.png"
    },
    345 => {
      :name => "南方ラバウル基地戦域",
      :cells => [
        {
          :name => "南方海域潜水艦哨戒線",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海リコリス航空隊",
          :point => :B,
          :index => [2]
        },
        {
          :name => "南方海域警戒任務部隊",
          :point => :C,
          :index => [3]
        },
        {
          :name => "任務部隊 III群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "南方深海任務部隊 II群",
          :point => :E,
          :index => [5]
        },
        {
          :name => "任務部隊 II群",
          :point => :F,
          :index => [6]
        },
        #{
        #  :name => "南方海域潜水艦哨戒線",
        #  :point => :G,
        #  :index => [7]
        #},
        {
          :name => "深海リコリス航空隊",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海リコリス航空隊",
          :point => :I,
          :index => [9, 16]
        },
        {
          :name => "深海リコリス航空隊",
          :point => :J,
          :index => [10, 17]
        },
        {
          :name => "任務部隊 I群",
          :point => :K,
          :index => [11]
        },
        {
          :name => "アイアンボトムサウンド警戒隊",
          :point => :L,
          :index => [12, 18]
        },
        {
          :name => "深海リコリス航空基地",
          :point => :M,
          :index => [13],
          :boss => true
        },
        #{
        #  :name => "",
        #  :point => :N,
        #  :index => [14]
        #},
        #{
        #  :name => "",
        #  :point => :O,
        #  :index => [15]
        #},
      ],
      :map => "MapE-5Spring2016.png"
    },
    346 => {
      :name => "北太平洋深海中枢泊地沖",
      :cells => [
        {
          :name => "深海中枢泊地所属潜水艦隊 I群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海中枢泊地航空隊",
          :point => :B,
          :index => [2]
        },
        {
          :name => "空母任務部隊 A群",
          :point => :C,
          :index => [3, 17]
        },
        {
          :name => "空母任務部隊 D群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "空母任務部隊 C群",
          :point => :E,
          :index => [5]
        },
        {
          :name => "空母任務部隊 B群",
          :point => :F,
          :index => [6, 18]
        },
        {
          :name => "北太平洋深海兵站護衛船団",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海中枢泊地航空隊",
          :point => :H,
          :index => [8]
        },
        {
          :name => "護衛空母集団",
          :point => :I,
          :index => [9]
        },
        {
          :name => "深海中枢泊地航空隊",
          :point => :J,
          :index => [10]
        },
        {
          :name => "深海中枢泊地所属潜水艦隊 II群",
          :point => :K,
          :index => [11, 19]
        },
        {
          :name => "深海太平洋艦隊主力任務部隊",
          :point => :L,
          :index => [12]
        },
        #{
        #  :name => "",
        #  :point => :M,
        #  :index => [13]
        #},
        {
          :name => "北太平洋深海中枢泊地",
          :point => :N,
          :index => [14, 20, 21],
          :boss => true
        },
        #{
        #  :name => "",
        #  :point => :O,
        #  :index => [15, 22]
        #},
        #{
        #  :name => "",
        #  :point => :P,
        #  :index => [16]
        #},
      ],
      :map => "MapE-6Spring2016.png"
    },
    347 => {
      :name => "北太平洋戦域",
      :cells => [
        {
          :name => "高速空母任務部隊",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海中枢泊地潜水艦隊 警戒部隊",
          :point => :B,
          :index => [2]
        },
        #{
        #  :name => "",
        #  :point => :C,
        #  :index => [3]
        #},
        {
          :name => "深海中枢泊地 特殊任務部隊",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海中枢泊地戦艦戦隊",
          :point => :E,
          :index => [5]
        },
        {
          :name => "護衛空母群 A集団",
          :point => :F,
          :index => [6]
        },
        {
          :name => "護衛空母群 B集団",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海中枢泊地航空隊",
          :point => :H,
          :index => [8, 17]
        },
        #{
        #  :name => "",
        #  :point => :I,
        #  :index => [9, 18]
        #},
        {
          :name => "深海中枢泊地航空隊",
          :point => :J,
          :index => [10]
        },
        {
          :name => "深海中枢泊地潜水艦隊旗艦",
          :point => :K,
          :index => [11]
        },
        {
          :name => "空母機動部隊 主力艦隊",
          :point => :L,
          :index => [12, 19]
        },
        {
          :name => "中枢泊地 再編成巡洋艦戦隊",
          :point => :M,
          :index => [13, 20]
        },
        {
          :name => "北太平洋深海中枢泊地",
          :point => :N,
          :index => [14, 21],
          :boss => true
        },
        #{
        #  :name => "",
        #  :point => :O,
        #  :index => [15]
        #},
        #{
        #  :name => "",
        #  :point => :P,
        #  :index => [16]
        #},
      ],
      :map => "MapE-7Spring2016.png"
    },
    351 => {
      :name => "南西海域 ブンタン沖",
      :cells => [
        {
          :name => "深海東洋艦隊 先遣巡洋艦隊",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海東洋艦隊 偵察潜水艦隊 II群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海東洋艦隊 先遣機動部隊",
          :point => :C,
          :index => [3, 10]
        },
        #{
        #  :name => "D",
        #  :point => :D,
        #  :index => [4]
        #},
        {
          :name => "深海東洋艦隊 前衛水雷戦隊",
          :point => :E,
          :index => [5]
        },
        {
          :name => "深海東洋艦隊 偵察潜水艦隊 I群",
          :point => :F,
          :index => [6, 11, 12]
        },
        {
          :name => "深海東洋艦隊 侵攻上陸部隊",
          :point => :G,
          :index => [7]
        },
        #{
        #  :name => "H",
        #  :point => :H,
        #  :index => [8]
        #},
        {
          :name => "深海東洋艦隊 潜水司令母艦",
          :point => :I,
          :index => [9],
          :boss => true
        },
      ],
      :map => "MapE-1Summer2016.png"
    },
    352 => {
      :name => "南西海域 エンドウ沖",
      :cells => [
        {
          :name => "深海東洋艦隊 警戒部隊 IV群",
          :point => :A,
          :index => [1]
        },
        #{
        #  :name => "B",
        #  :point => :B,
        #  :index => [2]
        #},
        #{
        #  :name => "C",
        #  :point => :C,
        #  :index => [3]
        #},
        {
          :name => "深海東洋艦隊 警戒部隊 III群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海東洋艦隊 群狼潜水部隊",
          :point => :E,
          :index => [5, 14]
        },
        {
          :name => "深海東洋艦隊 潜水艦哨戒線",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海東洋艦隊 警戒部隊 II群",
          :point => :G,
          :index => [7, 15]
        },
        {
          :name => "深海東洋艦隊 艦載機部隊",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海東洋艦隊 警戒部隊 I群",
          :point => :I,
          :index => [9]
        },
        #{
        #  :name => "J",
        #  :point => :J,
        #  :index => [10]
        #},
        #{
        #  :name => "K",
        #  :point => :K,
        #  :index => [11]
        #},
        #{
        #  :name => "L",
        #  :point => :L,
        #  :index => [12]
        #},
        {
          :name => "深海東洋艦隊 Z部隊先遣艦隊",
          :point => :M,
          :index => [13],
          :boss => true
        },
      ],
      :map => "MapE-2Summer2016.png"
    },
    353 => {
      :name => "南西海域 マレー沖",
      :cells => [
        {
          :name => "深海東洋艦隊 艦載機部隊",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海東洋艦隊 前方展開潜水艦隊",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海東洋艦隊 機動部隊 B群",
          :point => :C,
          :index => [3, 11]
        },
        {
          :name => "深海東洋艦隊 艦載機部隊",
          :point => :D,
          :index => [4]
        },
        #{
        #  :name => "E",
        #  :point => :E,
        #  :index => [5]
        #},
        #{
        #  :name => "F",
        #  :point => :F,
        #  :index => [6]
        #},
        {
          :name => "深海東洋艦隊 機動部隊 A群",
          :point => :G,
          :index => [7, 12, 13, 14]
        },
        {
          :name => "深海東洋艦隊 Z部隊",
          :point => :H,
          :index => [8]
        },
        #{
        #  :name => "I",
        #  :point => :I,
        #  :index => [9]
        #},
        {
          :name => "深海東洋方面 拠点港湾要塞",
          :point => :J,
          :index => [10],
          :boss => true
        }
      ],
      :map => "MapE-3Summer2016.png"
    },
    354 => {
      :name => "南西海域 マラッカ海峡沖",
      :cells => [
        {
          :name => "東洋方面航空団 先制攻撃",
          :point => :A,
          :index => [1]
        },
        #{
        #  :name => "B",
        #  :point => :B,
        #  :index => [2]
        #},
        {
          :name => "深海東洋艦隊 戦艦部隊",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海東洋艦隊 G部隊 II群",
          :point => :D,
          :index => [4]
        },
        #{
        #  :name => "E",
        #  :point => :E,
        #  :index => [5]
        #},
        {
          :name => "深海東洋艦隊 残存潜水艦隊",
          :point => :F,
          :index => [6, 18]
        },
        {
          :name => "東洋方面航空団 全力出撃",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海東洋艦隊 G部隊 I群",
          :point => :H,
          :index => [8]
        },
        {
          :name => "拠点港湾要塞(再建中)",
          :point => :I,
          :index => [9, 19, 20]
        },
        #{
        #  :name => "J",
        #  :point => :J,
        #  :index => [10]
        #},
        {
          :name => "深海東洋艦隊 Z部隊増派部隊",
          :point => :K,
          :index => [11]
        },
        {
          :name => "深海東洋方面 艦載機群第一波",
          :point => :L,
          :index => [12]
        },
        {
          :name => "深海東洋方面 艦載機群第二波",
          :point => :M,
          :index => [13, 21, 22]
        },
        {
          :name => "深海東洋艦隊 潜水艦隊旗艦",
          :point => :N,
          :index => [14]
        },
        #{
        #  :name => "O",
        #  :point => :O,
        #  :index => [15]
        #},
        #{
        #  :name => "P",
        #  :point => :P,
        #  :index => [16]
        #},
        {
          :name => "深海東洋方面 侵攻艦隊旗艦",
          :point => :Q,
          :index => [17],
          :boss => true
        },
      ],
      :map => "MapE-4Summer2016.png"
    },
    361 => {
      :name => "本土近海諸島補給線",
      :cells => [
        #{
        #  :name => "",
        #  :point => :A,
        #  :index => [1]
        #},
        {
          :name => "任務部隊 偵察潜水艦 II群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "通商破壊部隊 軽快水雷戦隊 II群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "通商破壊部隊 軽快水雷戦隊 I群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "16th任務部隊 先遣水上打撃部隊",
          :point => :E,
          :index => [5, 13, 14]
        },
        {
          :name => "任務部隊 偵察潜水艦 I群",
          :point => :F,
          :index => [6, 15]
        },
        #{
        #  :name => "",
        #  :point => :G,
        #  :index => [7]
        #},
        #{
        #  :name => "",
        #  :point => :H,
        #  :index => [8, 16, 17]
        #},
        #{
        #  :name => "",
        #  :point => :I,
        #  :index => [9]
        #},
        {
          :name => "通商破壊部隊 機動部隊群",
          :point => :J,
          :index => [10]
        },
        #{
        #  :name => "",
        #  :point => :K,
        #  :index => [11]
        #},
        {
          :name => "任務部隊 先遣潜水艦隊旗艦",
          :point => :L,
          :index => [12, 18],
          :boss => true
        }
      ],
      :map => "MapE-1Autumn2016.png"
    },
    362 => {
      :name => "本土沖",
      :cells => [
        {
          :name => "16th任務部隊 前衛空母群 B群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "16th任務部隊 前衛空母群 B群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "16th任務部隊 護衛水雷戦隊 A群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "16th任務部隊 護衛水雷戦隊 B群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "侵入潜水艦部隊 II群",
          :point => :E,
          :index => [5]
        },
        {
          :name => "侵入潜水艦部隊 I群",
          :point => :F,
          :index => [6, 16, 17]
        },
        {
          :name => "16th任務部隊 前衛空母群 A群",
          :point => :G,
          :index => [7, 18]
        },
        {
          :name => "18th任務部隊 先遣巡洋艦部隊",
          :point => :H,
          :index => [8, 19]
        },
        #{
        #  :name => "",
        #  :point => :I,
        #  :index => [9, 20, 21]
        #},
        {
          :name => "16th任務部隊 前衛空母群 A群",
          :point => :J,
          :index => [10]
        },
        {
          :name => "16th任務部隊 主力空母群",
          :point => :K,
          :index => [11]
        },
        {
          :name => "16th任務部隊 主力空母群",
          :point => :L,
          :index => [12]
        },
        #{
        #  :name => "",
        #  :point => :M,
        #  :index => [13]
        #},
        #{
        #  :name => "",
        #  :point => :N,
        #  :index => [14]
        #},
        {
          :name => "16th任務部隊 主力空母群",
          :point => :O,
          :index => [15, 22],
          :boss => true
        }
      ],
      :map => "MapE-2Autumn2016.png"
    },
    363 => {
      :name => "本土沖太平洋上",
      :cells => [
        {
          :name => "16th任務部隊 C群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "任務部隊 前衛潜水艦隊",
          :point => :B,
          :index => [2, 18]
        },
        {
          :name => "16th任務部隊 C群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "任務部隊付属 深海巡洋艦戦隊",
          :point => :D,
          :index => [4]
        },
        #{
        #  :name => "",
        #  :point => :E,
        #  :index => [5, 19, 20]
        #},
        {
          :name => "16th任務部隊 B群",
          :point => :F,
          :index => [6]
        },
        #{
        #  :name => "",
        #  :point => :G,
        #  :index => [7]
        #},
        {
          :name => "16th任務部隊 B群",
          :point => :H,
          :index => [8, 21]
        },
        {
          :name => "16th任務部隊 B群",
          :point => :I,
          :index => [9, 22]
        },
        {
          :name => "16th任務部隊 A群",
          :point => :J,
          :index => [10, 23]
        },
        {
          :name => "任務部隊支援 水上打撃部隊",
          :point => :K,
          :index => [11, 24]
        },
        {
          :name => "16th任務部隊 主力機動部隊群",
          :point => :L,
          :index => [12, 25]
        },
        #{
        #  :name => "",
        #  :point => :M,
        #  :index => [13]
        #},
        #{
        #  :name => "",
        #  :point => :N,
        #  :index => [14]
        #},
        #{
        #  :name => "",
        #  :point => :O,
        #  :index => [15, 26]
        #},
        #{
        #  :name => "",
        #  :point => :P,
        #  :index => [16]
        #},
        {
          :name => "16th任務部隊 主力機動部隊群",
          :point => :Q,
          :index => [17, 27],
          :boss => true
        },
      ],
      :map => "MapE-3Autumn2016.png"
    },
    364 => {
      :name => "MS諸島北部",
      :cells => [
        {
          :name => "待ち伏せ深海潜水艦隊 I群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "中部方面 深海機動部隊 B群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海棲艦 中部方面水雷戦隊",
          :point => :C,
          :index => [3]
        },
        {
          :name => "待ち伏せ深海潜水艦隊 II群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "中部方面 深海機動部隊 A群",
          :point => :E,
          :index => [5]
        },
        #{
        #  :name => "",
        #  :point => :F,
        #  :index => [6]
        #},
        {
          :name => "中部方面 深海機動部隊 B群",
          :point => :G,
          :index => [7, 23]
        },
        {
          :name => "中部方面 深海機動部隊 A群",
          :point => :H,
          :index => [8, 24, 25]
        },
        #{
        #  :name => "",
        #  :point => :I,
        #  :index => [9]
        #},
        {
          :name => "中部方面 深海機動部隊 A群",
          :point => :J,
          :index => [10, 26, 27]
        },
        #{
        #  :name => "",
        #  :point => :K,
        #  :index => [11]
        #},
        #{
        #  :name => "",
        #  :point => :L,
        #  :index => [12]
        #},
        {
          :name => "拠点強襲任務部隊 巡洋艦戦隊",
          :point => :M,
          :index => [13]
        },
        {
          :name => "新生深海機動部隊 先遣隊",
          :point => :N,
          :index => [14]
        },
        {
          :name => "拠点強襲任務部隊 機動部隊群",
          :point => :O,
          :index => [15]
        },
        {
          :name => "深海精鋭潜水艦隊 先遣部隊",
          :point => :P,
          :index => [16]
        },
        {
          :name => "拠点強襲任務部隊 機動部隊群",
          :point => :Q,
          :index => [17]
        },
        {
          :name => "新生深海機動部隊 先遣隊",
          :point => :R,
          :index => [18, 28]
        },
        {
          :name => "任務部隊支援 水上打撃部隊",
          :point => :S,
          :index => [19, 29, 30]
        },
        #{
        #  :name => "",
        #  :point => :T,
        #  :index => [20]
        #},
        #{
        #  :name => "",
        #  :point => :U,
        #  :index => [21]
        #},
        {
          :name => "拠点強襲任務部隊 機動部隊群",
          :point => :V,
          :index => [22],
          :boss => true
        }
      ],
      :map => "MapE-4Autumn2016.png"
    },
    365 => {
      :name => "MS諸島北部 B環礁沖",
      :cells => [
        {
          :name => "深海兵站線 大規模護衛輸送船団",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海精鋭潜水艦隊 警戒隊",
          :point => :B,
          :index => [2]
        },
        {
          :name => "新生深海機動部隊 II群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海兵站線 大規模護衛輸送船団",
          :point => :D,
          :index => [4, 21]
        },
        {
          :name => "新生深海機動部隊 II群",
          :point => :E,
          :index => [5]
        },
        {
          :name => "深海兵站線 補給艦隊",
          :point => :F,
          :index => [6]
        },
        {
          :name => "新生深海機動部隊 II群",
          :point => :G,
          :index => [7, 22]
        },
        {
          :name => "新生 深海水雷戦隊 II群",
          :point => :H,
          :index => [8]
        },
        #{
        #  :name => "",
        #  :point => :I,
        #  :index => [9, 27]
        #},
        {
          :name => "深海精鋭潜水艦隊 群狼部隊 II群",
          :point => :J,
          :index => [10]
        },
        {
          :name => "新生 深海水雷戦隊 I群",
          :point => :K,
          :index => [11, 23, 28]
        },
        #{
        #  :name => "",
        #  :point => :L,
        #  :index => [12]
        #},
        {
          :name => "深海精鋭潜水艦隊 群狼部隊 I群",
          :point => :M,
          :index => [13, 29]
        },
        {
          :name => "新生深海機動部隊 I群",
          :point => :N,
          :index => [14, 24]
        },
        {
          :name => "新生深海機動部隊 I群",
          :point => :O,
          :index => [15, 25]
        },
        {
          :name => "海月渚泊地 旗艦艦隊",
          :point => :P,
          :index => [16]
        },
        #{
        #  :name => "",
        #  :point => :Q,
        #  :index => [17]
        #},
        #{
        #  :name => "",
        #  :point => :R,
        #  :index => [18]
        #},
        #{
        #  :name => "",
        #  :point => :S,
        #  :index => [19]
        #},
        {
          :name => "海月渚泊地 旗艦艦隊",
          :point => :T,
          :index => [20],
          :boss => true
        },
        {
          :name => "新生 深海水雷戦隊 III群",
          :point => :U,
          :index => [26]
        }
      ],
      :map => "MapE-5Autumn2016.png"
    },
    371 => {
      :name => "日本近海/七尾北湾/舞鶴湾",
      :cells => [
        {
          :name => "深海侵入潜水艦隊 先遣群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海軽快戦隊 先行侵入群",
          :point => :B,
          :index => [2, 12, 13]
        },
        #{
        #  :name => "",
        #  :point => :C,
        #  :index => [3]
        #},
        {
          :name => "深海侵入機動部隊 前衛群",
          :point => :D,
          :index => [4, 16]
        },
        #{
        #  :name => "",
        #  :point => :E,
        #  :index => [5]
        #},
        #{
        #  :name => "",
        #  :point => :F,
        #  :index => [6]
        #},
        #{
        #  :name => "",
        #  :point => :G,
        #  :index => [7]
        #},
        #{
        #  :name => "",
        #  :point => :H,
        #  :index => [8]
        #},
        {
          :name => "先遣侵入潜水艦隊旗艦",
          :point => :I,
          :index => [9]
        },
        #{
        #  :name => "",
        #  :point => :J,
        #  :index => [10]
        #},
        #{
        #  :name => "",
        #  :point => :K,
        #  :index => [11]
        #},
        {
          :name => "深海侵入機動部隊 前衛群",
          :point => :L,
          :index => [14]
        },
        {
          :name => "深海侵入機動部隊 前衛群",
          :point => :M,
          :index => [15]
        },
        #{
        #  :name => "",
        #  :point => :N,
        #  :index => [17]
        #}
      ],
      :map => "MapE-1Winter2017.png"
    },
    372 => {
      :name => "小笠原諸島航路",
      :cells => [
        {
          :name => "深海潜水艦隊 群狼集団",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海通商破壊機動部隊 II群",
          :point => :B,
          :index => [2]
        },
        #{
        #  :name => "",
        #  :point => :C,
        #  :index => [3]
        #},
        #{
        #  :name => "",
        #  :point => :D,
        #  :index => [4]
        #},
        {
          :name => "深海通商破壊機動部隊 II群",
          :point => :E,
          :index => [5, 14]
        },
        {
          :name => "深海侵入潜水艦隊 先遣群",
          :point => :F,
          :index => [6, 15]
        },
        {
          :name => "深海通商破壊機動部隊 I群",
          :point => :G,
          :index => [7, 16]
        },
        {
          :name => "深海通商破壊部隊 支援集団",
          :point => :H,
          :index => [8, 17]
        },
        {
          :name => "深海通商破壊機動部隊 III群",
          :point => :I,
          :index => [9, 18]
        },
        {
          :name => "深海軽快水雷戦隊",
          :point => :J,
          :index => [10, 19, 20]
        },
        #{
        #  :name => "",
        #  :point => :K,
        #  :index => [11, 21]
        #},
        #{
        #  :name => "",
        #  :point => :L,
        #  :index => [12]
        #},
        {
          :name => "深海通商破壊機動部隊 旗艦集団",
          :point => :M,
          :index => [13],
          :boss => true
        }
      ],
      :map => "MapE-2Winter2017.png"
    },
    373 => {
      :name => "トラック泊地沖",
      :cells => [
        {
          :name => "深海任務部隊 空母III群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海任務部隊 特殊遊撃群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海任務部隊 空母III群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海任務部隊 火力支援群",
          :point => :D,
          :index => [4, 20, 21]
        },
        #{
        #  :name => "",
        #  :point => :E,
        #  :index => [5]
        #},
        {
          :name => "深海任務部隊 強襲戦隊旗艦",
          :point => :F,
          :index => [6]
        },
        #{
        #  :name => "",
        #  :point => :G,
        #  :index => [7]
        #},
        {
          :name => "深海離島守備隊 基地航空隊",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海任務部隊 強襲戦隊旗艦",
          :point => :I,
          :index => [9]
        },
        {
          :name => "深海離島守備隊",
          :point => :J,
          :index => [10, 30]
        },
        {
          :name => "離島基地哨戒 潜水艦隊群",
          :point => :K,
          :index => [11]
        },
        {
          :name => "深海泊地 主力空母機動部隊",
          :point => :L,
          :index => [12, 31, 32]
        },
        {
          :name => "深海環礁 大規模泊地集結艦隊",
          :point => :M,
          :index => [13]
        },
        {
          :name => "深海泊地 水上打撃部隊",
          :point => :N,
          :index => [14, 22]
        },
        {
          :name => "深海泊地哨戒 主力潜水艦隊群",
          :point => :O,
          :index => [15]
        },
        #{
        #  :name => "",
        #  :point => :P,
        #  :index => [16]
        #},
        {
          :name => "深海環礁 大規模泊地集結艦隊",
          :point => :Q,
          :index => [17, 23]
        },
        #{
        #  :name => "",
        #  :point => :R,
        #  :index => [18]
        #},
        #{
        #  :name => "",
        #  :point => :S,
        #  :index => [25]
        #},
        {
          :name => "深海泊地 空母機動部隊 II群",
          :point => :T,
          :index => [26]
        },
        {
          :name => "深海離島守備隊 基地航空隊",
          :point => :V,
          :index => [27]
        },
        {
          :name => "深海泊地 空母機動部隊 I群",
          :point => :W,
          :index => [28]
        },
        {
          :name => "深海泊地 空母機動部隊 II群",
          :point => :X,
          :index => [29]
        },
        {
          :name => "深海環礁 大規模泊地集結艦隊",
          :point => :U,
          :index => [19, 24],
          :boss => true
        }
      ],
      :map => "MapE-3Winter2017.png"
    },
    381 => {
      :name => "津軽海峡/北海道沖",
      :cells => [
        {
          :name => "通商破壊部隊 北兎支援部隊 A群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "通商破壊部隊 北兎支援部隊 B群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海北方 奇襲侵攻部隊",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海北兎潜水艦隊 II群",
          :point => :F,
          :index => [6]
        },
        {
          :name => "通商破壊部隊 偵察水雷戦隊",
          :point => :I,
          :index => [9]
        },
        {
          :name => "通商破壊部隊 侵入巡洋艦戦隊",
          :point => :J,
          :index => [10]
        },
        {
          :name => "深海前方展開 巡洋艦戦隊",
          :point => :K,
          :index => [11, 15]
        },
        {
          :name => "深海北兎潜水艦隊 I群",
          :point => :L,
          :index => [12, 16]
        },
        {
          :name => "深海北兎潜水艦隊 旗艦",
          :point => :M,
          :index => [13, 17],
          :boss => true
        }
      ],
      :map => "MapE-1Spring2017.png"
    },
    382 => {
      :name => "津軽海峡/北海道沖",
      :cells => [
        {
          :name => "深海北兎潜水艦隊 残存部隊",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海北方展開群 上陸部隊前衛",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海北方展開群 上陸支援部隊",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海北方展開群 奇襲上陸部隊",
          :point => :D,
          :index => [4, 20]
        },
        {
          :name => "深海北兎潜水艦隊 II群",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海北方展開群 前方警戒部隊",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海北方展開群 前方潜水艦隊",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海北方展開群 前衛巡洋戦隊",
          :point => :K,
          :index => [11, 21]
        },
        {
          :name => "深海北方展開群 攻撃隊",
          :point => :M,
          :index => [13]
        },
        {
          :name => "深海北方展開群 襲撃部隊部隊",
          :point => :N,
          :index => [14]
        },
        {
          :name => "深海北方展開群 攻撃隊",
          :point => :O,
          :index => [15, 22]
        },
        {
          :name => "深海北方展開群 護衛空母部隊",
          :point => :Q,
          :index => [17, 23]
        },
        {
          :name => "深海北方展開群 泊地襲撃部隊",
          :point => :R,
          :index => [18, 24]
        },
        {
          :name => "深海北方展開群 泊地襲撃隊旗艦",
          :point => :T,
          :index => [25, 26],
          :boss => true
        }
      ],
      :map => "MapE-2Spring2017.png"
    },
    383 => {
      :name => "千島列島沖",
      :cells => [
        {
          :name => "深海北方集団 上陸輸送船団A群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海北方集団 上陸輸送船団B群",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海北方集団 上陸支援部隊群",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海北方集団 前方展開警戒群",
          :point => :K,
          :index => [10]
        },
        {
          :name => "深海北方集団 前衛軽快巡洋戦隊",
          :point => :P,
          :index => [12]
        },
        {
          :name => "深海北方集団 作戦支援群",
          :point => :R,
          :index => [13]
        },
        {
          :name => "深海北方集団 水上打撃部隊",
          :point => :S,
          :index => [14, 16]
        },
        {
          :name => "深海北方集団 攻撃隊",
          :point => :I,
          :index => [17]
        },
        {
          :name => "深海北方集団 潜水哨戒艦隊",
          :point => :L,
          :index => [18, 24]
        },
        {
          :name => "深海北方集団 機動部隊B群",
          :point => :O,
          :index => [20, 25]
        },
        {
          :name => "深海北方集団 増援阻止哨戒線",
          :point => :Q,
          :index => [21, 26, 27]
        },
        {
          :name => "深海北方集団 機動部隊A群",
          :point => :V,
          :index => [23]
        },
        {
          :name => "深海北方集団 機動部隊旗艦艦隊",
          :point => :W,
          :index => [29],
          :boss => true
        }
      ],
      :map => "MapE-3Spring2017.png"
    },
    384 => {
      :name => "占守島沖",
      :cells => [
        {
          :name => "深海北方集団 侵攻前衛部隊B群",
          :point => :A,
          :index => [1, 18]
        },
        {
          :name => "深海北方集団 航空支援攻撃隊",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海北方集団 侵攻支援空母C群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海北方集団 侵攻前衛部隊A群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海北方航空基地群 爆撃隊",
          :point => :E,
          :index => [5]
        },
        {
          :name => "深海北方集団 群狼潜水艦隊 II群",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海北方集団 侵攻高速打撃群",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海北方集団 侵攻上陸本隊",
          :point => :I,
          :index => [9, 19],
          :boss => true
        },
        {
          :name => "深海北方集団 侵攻支援空母A群",
          :point => :K,
          :index => [11, 20]
        },
        {
          :name => "深海北方集団 侵攻火力支援群",
          :point => :L,
          :index => [12]
        },
        {
          :name => "深海北方集団 航空支援攻撃隊",
          :point => :N,
          :index => [14]
        },
        {
          :name => "深海北方集団 群狼潜水艦隊 I群",
          :point => :O,
          :index => [15, 21]
        },
        {
          :name => "深海北方集団 航空支援攻撃隊",
          :point => :P,
          :index => [16, 22]
        },
        {
          :name => "深海北方集団 侵攻支援空母B群",
          :point => :Q,
          :index => [17]
        }
      ],
      :map => "MapE-4Spring2017.png"
    },
    385 => {
      :name => "大ホッケ海北方",
      :cells => [
        {
          :name => "深海北方艦隊 潜水部隊 II群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海北方艦隊 攻撃隊",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海北方艦隊 前衛展開部隊 B群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海北方艦隊 前衛展開部隊 A群",
          :point => :E,
          :index => [5]
        },
        {
          :name => "深海北方艦隊 攻撃機動部隊",
          :point => :F,
          :index => [6, 18]
        },
        {
          :name => "深海北方艦隊 支援戦闘集団",
          :point => :G,
          :index => [7, 19]
        },
        {
          :name => "深海北方艦隊 潜水部隊 I群",
          :point => :H,
          :index => [8, 20]
        },
        {
          :name => "深海北方艦隊 精鋭戦艦集団",
          :point => :K,
          :index => [10, 29]
        },
        {
          :name => "深海北方艦隊 攻撃隊",
          :point => :L,
          :index => [11]
        },
        {
          :name => "深海北方艦隊 主力空母機動部隊",
          :point => :M,
          :index => [12, 21, 22]
        },
        {
          :name => "深海北方艦隊 旗艦艦隊攻撃隊",
          :point => :O,
          :index => [13, 30]
        },
        {
          :name => "深海北方艦隊 精鋭戦艦集団",
          :point => :R,
          :index => [16, 24]
        },
        {
          :name => "深海北方艦隊 高速打撃予備群",
          :point => :N,
          :index => [27]
        },
        {
          :name => "深海北方艦隊 旗艦艦隊",
          :point => :T,
          :index => [28],
          :boss => true
        }
      ],
      :map => "MapE-5Spring2017.png"
    },
    391 => {
      :name => "リンガ泊地沖",
      :cells => [
        {
          :name => "深海東方侵入機動部隊",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海東方警戒部隊 B群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海東方侵入潜水艦隊 I群",
          :point => :E,
          :index => [5]
        },
        {
          :name => "深海東方警戒部隊 A群",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海東方警戒部隊 C群",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海東方通商破壊部隊 B群",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海東方通商破壊部隊 A群",
          :point => :K,
          :index => [11]
        },
        {
          :name => "深海東方通商破壊部隊 C群",
          :point => :L,
          :index => [12]
        },
        {
          :name => "深海東方侵入潜水艦隊 II群",
          :point => :N,
          :index => [14]
        },
        {
          :name => "深海東方侵入潜水艦隊 旗艦",
          :point => :P,
          :index => [16, 17],
          :boss => true
        },
        {
          :name => "深海南方配備魚雷艇部隊 II群",
          :point => :R,
          :index => [19, 21]
        },
        {
          :name => "深海南方配備魚雷艇部隊 I群",
          :point => :S,
          :index => [20]
        }
      ],
      :map => "MapE-1Summer2017.png"
    },
    392 => {
      :name => "カレー洋リランカ島沖",
      :cells => [
        {
          :name => "深海東方前方展開潜水艦隊 III群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海東方前方展開潜水艦隊 II群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "海峡前進配備 深海魚雷艇襲撃隊",
          :point => :D,
          :index => [4]
        },
        {
          :name => "リランカ基地防衛部隊",
          :point => :E,
          :index => [5]
        },
        {
          :name => "深海東方重巡戦隊",
          :point => :F,
          :index => [6]
        },
        {
          :name => "リランカ港湾基地",
          :point => :H,
          :index => [8]
        },
        {
          :name => "リランカ港湾基地",
          :point => :I,
          :index => [9]
        },
        {
          :name => "深海東方緊急展開 前衛機動部隊",
          :point => :J,
          :index => [10, 17]
        },
        {
          :name => "深海東方前方展開潜水艦隊 I群",
          :point => :K,
          :index => [11]
        },
        {
          :name => "深海東方緊急展開 前衛機動部隊",
          :point => :L,
          :index => [12]
        },
        {
          :name => "深海東方緊急展開 主力機動部隊",
          :point => :O,
          :index => [15, 20],
          :boss => true
        },
        {
          :name => "深海東方雷巡戦隊",
          :point => :P,
          :index => [18]
        },
        {
          :name => "深海精鋭駆逐隊",
          :point => :Q,
          :index => [19]
        }
      ],
      :map => "MapE-2Summer2017.png"
    },
    393 => {
      :name => "ステビア海",
      :cells => [
        {
          :name => "深海東方潜水艦隊 哨戒B群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海ステビア海機動部隊 C群",
          :point => :C,
          :index => [3, 13]
        },
        {
          :name => "深海ステビア海機動部隊 C群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海ステビア海機動部隊 B群",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海ステビア海輸送船団",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海ステビア海機動部隊 A群",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海ステビア海機動部隊 B群",
          :point => :I,
          :index => [9, 14]
        },
        {
          :name => "深海東方潜水艦隊 哨戒A群",
          :point => :J,
          :index => [10, 15]
        },
        {
          :name => "深海紅海展開 火力打撃群",
          :point => :L,
          :index => [12]
        },
        {
          :name => "深海ステビア海機動部隊 支援群",
          :point => :M,
          :index => [17]
        },
        {
          :name => "深海ステビア海機動部隊 A群",
          :point => :N,
          :index => [18, 22]
        },
        {
          :name => "深海東方方面艦隊 迎撃集団",
          :point => :Q,
          :index => [21, 23],
          :boss => true
        }
      ],
      :map => "MapE-3Summer2017.png"
    },
    394 => {
      :name => "紅海",
      :cells => [
        {
          :name => "深海東方艦隊 残存巡洋艦戦隊",
          :point => :A,
          :index => [1, 10]
        },
        {
          :name => "東方紅海艦隊 ソマリア支隊",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海紅海艦隊 火力打撃群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海東方潜水艦隊 残存部隊",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海紅海艦隊 ソマリア機動部隊群",
          :point => :I,
          :index => [9]
        },
        {
          :name => "深海紅海配備 魚雷艇襲撃隊",
          :point => :J,
          :index => [11]
        },
        {
          :name => "紅海方面 深海物資集積基地",
          :point => :K,
          :index => [12]
        },
        {
          :name => "紅海方面 深海物資集積基地",
          :point => :L,
          :index => [13]
        },
        {
          :name => "深海スエズ防衛 迎撃ライン",
          :point => :M,
          :index => [14, 17]
        },
        {
          :name => "深海スエズ防衛 最終ライン",
          :point => :N,
          :index => [15],
          :boss => true
        }
      ],
      :map => "MapE-4Summer2017.png"
    },
    395 => {
      :name => "地中海キプロス島沖",
      :cells => [
        {
          :name => "深海地中海東部方面 潜水艦隊",
          :point => :A,
          :index => [1]
        },
        {
          :name => "アフリカ方面 深海野営集積地",
          :point => :C,
          :index => [3]
        },
        {
          :name => "ギリシャ方面 深海兵站輸送部隊",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海地中海艦隊 警戒重雷装戦隊",
          :point => :E,
          :index => [5, 14]
        },
        {
          :name => "マルタ島展開 深海機動部隊",
          :point => :F,
          :index => [6, 15]
        },
        {
          :name => "マルタ島展開 深海機動部隊",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海地中海艦隊 水雷戦隊",
          :point => :I,
          :index => [9, 16]
        },
        {
          :name => "マルタ島展開 深海機動部隊",
          :point => :J,
          :index => [10, 17]
        },
        {
          :name => "深海地中海東部方面 航空基地",
          :point => :K,
          :index => [11, 18]
        },
        {
          :name => "深海地中海艦隊 東部方面旗艦",
          :point => :M,
          :index => [13],
          :boss => true
        }
      ],
      :map => "MapE-5Summer2017.png"
    },
    396 => {
      :name => "地中海マルタ島沖",
      :cells => [
        {
          :name => "地中海配備 深海魚雷艇襲撃群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海地中海艦隊 水雷戦隊",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海地中海艦隊 戦艦戦隊A群",
          :point => :D,
          :index => [4, 10]
        },
        {
          :name => "深海地中海艦隊　潜水戦隊III群",
          :point => :E,
          :index => [5]
        },
        {
          :name => "深海地中海艦隊 戦艦戦隊B群",
          :point => :G,
          :index => [7, 12, 13]
        },
        {
          :name => "マルタ島展開 深海戦闘集団",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海地中海艦隊 護衛空母群",
          :point => :K,
          :index => [15, 24]
        },
        {
          :name => "深海地中海艦隊 特殊任務群",
          :point => :L,
          :index => [16]
        },
        {
          :name => "深海地中海艦隊　潜水戦隊I群",
          :point => :M,
          :index => [17]
        },
        {
          :name => "深海地中海艦隊 機動部隊前衛",
          :point => :N,
          :index => [18]
        },
        {
          :name => "深海地中海艦隊 特殊任務群",
          :point => :O,
          :index => [19, 25]
        },
        {
          :name => "深海地中海艦隊 機動部隊前衛",
          :point => :P,
          :index => [20, 26, 27]
        },
        {
          :name => "深海地中海艦隊　潜水戦隊II群",
          :point => :R,
          :index => [22]
        },
        {
          :name => "地中海展開 深海機動部隊主力",
          :point => :S,
          :index => [23],
          :boss => true
        }
      ],
      :map => "MapE-6Summer2017.png"
    },
    397 => {
      :name => "北大西洋海域",
      :cells => [
        {
          :name => "深海北部大西洋艦隊 任務群A",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海北部大西洋艦隊 警戒隊II群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海北部大西洋艦隊 任務群A",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海北部大西洋艦隊 任務群A",
          :point => :E,
          :index => [5, 23]
        },
        {
          :name => "深海北部大西洋艦隊 任務群B",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海北部大西洋艦隊 警戒隊I群",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海欧州潜水艦隊 群狼II群",
          :point => :H,
          :index => [8, 24, 25]
        },
        {
          :name => "深海欧州潜水艦隊 群狼IV群",
          :point => :I,
          :index => [9]
        },
        {
          :name => "深海欧州潜水艦隊 群狼I群",
          :point => :J,
          :index => [10]
        },
        {
          :name => "深海欧州潜水艦隊 群狼III群",
          :point => :K,
          :index => [11]
        },
        {
          :name => "深海港湾拠点部 攻撃航空基地",
          :point => :L,
          :index => [12]
        },
        {
          :name => "深海拠点港湾部 防衛部隊",
          :point => :M,
          :index => [13]
        },
        {
          :name => "深海欧州主力艦隊 前衛部隊",
          :point => :N,
          :index => [14]
        },
        {
          :name => "深海潜水艦隊 出撃拠点港湾部",
          :point => :P,
          :index => [16, 26]
        },
        {
          :name => "深海欧州主力艦隊 機動部隊",
          :point => :Q,
          :index => [17]
        },
        {
          :name => "深海欧州艦隊 兵站補給船団",
          :point => :R,
          :index => [18]
        },
        {
          :name => "ドーバー海峡緊急封鎖部隊",
          :point => :T,
          :index => [20]
        },
        {
          :name => "深海欧州主力艦隊 旗艦艦隊",
          :point => :U,
          :index => [21],
          :boss => true
        }
      ],
      :map => "MapE-7Summer2017.png"
    },
    401 => {
      :name => "奄美群島沖/台湾沖",
      :cells => [
        {
          :name => "深海前衛潜水艦部隊 B群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海前衛潜水艦部隊 C群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海任務部隊 前衛軽空母C群",
          :point => :E,
          :index => [5]
        },
        {
          :name => "深海任務部隊 前衛軽空母C群",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海前衛潜水艦部隊 A群",
          :point => :J,
          :index => [10]
        },
        {
          :name => "深海任務部隊 前衛軽空母B群",
          :point => :K,
          :index => [11]
        },
        {
          :name => "深海任務部隊 前衛軽空母B群",
          :point => :L,
          :index => [12]
        },
        {
          :name => "深海任務部隊 前衛軽空母群空襲",
          :point => :N,
          :index => [14]
        },
        {
          :name => "深海任務部隊 前衛軽空母群旗艦",
          :point => :O,
          :index => [15]
        },
        {
          :name => "深海任務部隊 正規空母群",
          :point => :Q,
          :index => [17]
        },
        {
          :name => "深海任務部隊 前衛軽空母群旗艦",
          :point => :S,
          :index => [19],
          :boss => true
        }
      ],
      :map => "MapE-1Autumn2017.png"
    },
    402 => {
      :name => "台湾沖/ルソン島沖",
      :cells => [
        {
          :name => "深海潜水艦部隊 通商破壊Aライン",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海任務部隊 増援空母II群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海任務部隊 増援増援I群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海通商破部隊 前衛水雷戦隊",
          :point => :E,
          :index => [5]
        },
        {
          :name => "深海任務部隊 増援空母II群",
          :point => :F,
          :index => [6, 17]
        },
        {
          :name => "深海任務部隊 増援増援I群",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海潜水艦部隊 通商破壊Bライン",
          :point => :I,
          :index => [9, 21]
        },
        {
          :name => "深海潜水艦部隊 通商破壊群旗艦",
          :point => :J,
          :index => [10]
        },
        {
          :name => "深海通商破壊部隊付属 雷巡戦隊",
          :point => :K,
          :index => [11, 22]
        },
        {
          :name => "深海通商破壊部隊 高速戦艦戦隊",
          :point => :L,
          :index => [12, 23]
        },
        {
          :name => "深海通商破壊部隊 主力戦隊空襲",
          :point => :M,
          :index => [13]
        },
        {
          :name => "深海通商破壊部隊 主力戦隊旗艦",
          :point => :P,
          :index => [16],
          :boss => true
        },
        {
          :name => "深海通商破壊部隊 主力戦隊空襲",
          :point => :Q,
          :index => [20]
        }
      ],
      :map => "MapE-2Autumn2017.png"
    },
    403 => {
      :name => "捷一号作戦 作戦海域",
      :cells => [
        {
          :name => "深海潜水艦部隊 群狼III群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海任務部隊 突撃水雷戦隊",
          :point => :B,
          :index => [2, 13]
        },
        {
          :name => "深海任務部隊 第一次攻撃隊",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海潜水艦部隊 群狼II群",
          :point => :D,
          :index => [4, 8]
        },
        {
          :name => "深海任務部隊 増援阻止線",
          :point => :E,
          :index => [5]
        },
        {
          :name => "深海任務部隊 第二次攻撃隊",
          :point => :F,
          :index => [6, 9]
        },
        {
          :name => "深海任務部隊 水上打撃部隊",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海任務部隊 後方強襲集団",
          :point => :J,
          :index => [12]
        },
        {
          :name => "深海任務部隊 上陸火力支援群",
          :point => :K,
          :index => [15]
        },
        {
          :name => "深海任務部隊 上陸兵団揚陸艦隊",
          :point => :L,
          :index => [16, 25]
        },
        {
          :name => "深海潜水艦部隊 群狼I群",
          :point => :N,
          :index => [18, 26]
        },
        {
          :name => "深海任務部隊 空母打撃群攻撃隊",
          :point => :O,
          :index => [19]
        },
        {
          :name => "深海任務部隊 警戒護衛部隊",
          :point => :P,
          :index => [20]
        },
        {
          :name => "深海任務部隊 空母打撃群攻撃隊",
          :point => :Q,
          :index => [21, 27, 28]
        },
        {
          :name => "深海任務部隊 空母打撃群",
          :point => :R,
          :index => [22, 29]
        },
        {
          :name => "深海任務部隊 空母打撃群旗艦",
          :point => :S,
          :index => [23],
          :boss => true
        }
      ],
      :map => "MapE-3Autumn2017.png"
    },
    404 => {
      :name => "スリガオ海峡沖",
      :cells => [
        {
          :name => "深海潜水艦部隊 待伏C群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海任務部隊  艦載機空襲",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海潜水艦部隊 待伏A群",
          :point => :G,
          :index => [7, 26]
        },
        {
          :name => "深海潜水艦部隊 待伏B群",
          :point => :H,
          :index => [8, 27]
        },
        {
          :name => "深海潜水艦展開 阻止第1線",
          :point => :I,
          :index => [9]
        },
        {
          :name => "深海潜水艦部隊 主力待伏群",
          :point => :J,
          :index => [10, 28]
        },
        {
          :name => "深海潜水艦展開 阻止第2線",
          :point => :K,
          :index => [11]
        },
        {
          :name => "深海任務部隊  艦載機空襲",
          :point => :M,
          :index => [13]
        },
        {
          :name => "深海任務部隊  艦載機空襲",
          :point => :N,
          :index => [14]
        },
        {
          :name => "深海任務部隊  艦載機空襲",
          :point => :O,
          :index => [15]
        },
        {
          :name => "深海任務部隊 火力支援部隊",
          :point => :R,
          :index => [18]
        },
        {
          :name => "深海任務部隊 前方警戒A群",
          :point => :S,
          :index => [19, 30, 31]
        },
        {
          :name => "深海潜水艦展開 阻止第3線",
          :point => :T,
          :index => [20, 32]
        },
        {
          :name => "深海任務部隊 水上阻止艦隊線",
          :point => :U,
          :index => [21]
        },
        {
          :name => "深海任務部隊  艦載機空襲",
          :point => :V,
          :index => [33]
        },
        {
          :name => "深海任務部隊 島嶼展開警戒群",
          :point => :W,
          :index => [23, 34]
        },
        {
          :name => "深海任務部隊 前方警戒B群",
          :point => :X,
          :index => [24]
        },
        {
          :name => "深海任務部隊 海峡前方警戒群",
          :point => :Y,
          :index => [25, 35]
        },
        {
          :name => "深海任務部隊  艦載機空襲",
          :point => :Z1,
          :index => [38]
        },
        {
          :name => "深海任務部隊  艦載機空襲",
          :point => :Z2,
          :index => [39]
        },
        {
          :name => "深海任務部隊 島嶼配備PT部隊",
          :point => :Z3,
          :index => [40]
        },
        {
          :name => "レイテ侵攻集団 護衛空母随伴群",
          :point => :Z4,
          :index => [41]
        },
        {
          :name => "レイテ侵攻集団 護衛空母群",
          :point => :Z6,
          :index => [43]
        },
        {
          :name => "深海任務部隊 島嶼配備PT部隊",
          :point => :Z7,
          :index => [44]
        },
        {
          :name => "深海水上打撃部隊 巡洋艦集団",
          :point => :Z8,
          :index => [45]
        },
        {
          :name => "深海水上打撃部隊 駆逐隊群",
          :point => :Z9,
          :index => [46]
        },
        {
          :name => "深海任務部隊 島嶼配備PT部隊",
          :point => :ZZ1,
          :index => [47, 50]
        },
        {
          :name => "深海水上打撃部隊 駆逐隊群",
          :point => :ZZ2,
          :index => [48]
        },
        {
          :name => "スリガオ海峡 深海海峡旗艦艦隊",
          :point => :ZZ3,
          :index => [49],
          :boss => true
        }
      ],
      :map => "MapE-4Autumn2017.png"
    },
    411 => {
      :name => "パラワン水道/作戦海域",
      :cells => [
        {
          :name => "深海潜水艦 待伏部隊D群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海潜水艦 待伏部隊B群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海潜水艦 待伏支援部隊 II群",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海潜水艦 待伏部隊E群",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海潜水艦 待伏部隊A群",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海潜水艦 待伏支援部隊 I群",
          :point => :I,
          :index => [9]
        },
        {
          :name => "深海潜水艦 待伏部隊C群",
          :point => :J,
          :index => [10]
        },
        {
          :name => "深海侵攻任務部隊 哨戒艦隊",
          :point => :K,
          :index => [11, 16]
        },
        {
          :name => "深海侵攻任務部隊 哨戒艦隊旗艦",
          :point => :N,
          :index => [14]
        },
        {
          :name => "深海潜水待伏部隊 指揮潜水艦",
          :point => :O,
          :index => [18],
          :boss => true
        }
      ],
      :map => "MapE-1Winter2018.png"
    },
    412 => {
      :name => "シブヤン海",
      :cells => [
        {
          :name => "深海潜水艦 待伏前衛部隊B群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海潜水艦 待伏支援部隊 II群",
          :point => :C,
          :index => [3, 28]
        },
        {
          :name => "深海潜水艦 待伏前衛部隊A群",
          :point => :E,
          :index => [5, 29]
        },
        {
          :name => "深海潜水艦 待伏部隊本隊",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海潜水艦 待伏前衛部隊C群",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海潜水艦 待伏増派部隊",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海潜水艦 待伏支援部隊 I群",
          :point => :I,
          :index => [9]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :K,
          :index => [11]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :M,
          :index => [13]
        },
        {
          :name => "深海潜水艦 第二待伏部隊",
          :point => :N,
          :index => [14]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :R,
          :index => [18]
        },
        {
          :name => "深棲棲艦 島嶼配備PT部隊",
          :point => :S,
          :index => [19]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :T,
          :index => [20, 34]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :U,
          :index => [21]
        },
        {
          :name => "深海任務部隊 護衛艦艇群",
          :point => :V,
          :index => [22]
        },
        {
          :name => "深海任務部隊 護衛空母群",
          :point => :W,
          :index => [23]
        },
        {
          :name => "深棲棲艦 海峡配備水雷戦隊",
          :point => :X,
          :index => [24]
        },
        {
          :name => "深棲棲艦 海峡旧式戦艦部隊",
          :point => :Y,
          :index => [25]
        },
        {
          :name => "深海任務部隊 護衛空母群",
          :point => :Z,
          :index => [26],
          :boss => true
        }
      ],
      :map => "MapE-2Winter2018.png"
    },
    413 => {
      :name => "エンガノ岬沖",
      :cells => [
        {
          :name => "深海潜水艦 通商破壊部隊 III群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海通商破壊部隊 支援戦闘団",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海潜水艦 通商破壊部隊 II群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :D,
          :index => [4, 22, 23]
        },
        {
          :name => "深海潜水艦 通商破壊部隊 I群",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海任務部隊 護衛空母群",
          :point => :I,
          :index => [9]
        },
        {
          :name => "深海任務部隊 護衛空母群",
          :point => :J,
          :index => [10, 24]
        },
        {
          :name => "深海任務部隊 空母群",
          :point => :K,
          :index => [11, 25]
        },
        {
          :name => "深海潜水部隊 任務部隊付属群",
          :point => :M,
          :index => [13]
        },
        {
          :name => "深海任務部隊 空母群",
          :point => :N,
          :index => [14, 30]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :O,
          :index => [15, 26]
        },
        {
          :name => "深海任務部隊 空母II群",
          :point => :P,
          :index => [16]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :Q,
          :index => [17]
        },
        {
          :name => "深海任務部隊 空母I群",
          :point => :S,
          :index => [19, 27, 28]
        },
        {
          :name => "深海任務部隊 第二戦闘群旗艦",
          :point => :U,
          :index => [21],
          :boss => true
        }
      ],
      :map => "MapE-3Winter2018.png"
    },
    414 => {
      :name => "サマール沖/レイテ湾",
      :cells => [
        {
          :name => "深海潜水艦部隊 阻止線",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海任務部隊 空母群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海任務部隊 空母群",
          :point => :E,
          :index => [5, 24]
        },
        {
          :name => "深海任務部隊 哨戒警戒線",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海任務部隊 哨戒警戒線",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :I,
          :index => [9, 25]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :J,
          :index => [10]
        },
        {
          :name => "深海任務部隊 海峡守備PT部隊",
          :point => :M,
          :index => [13]
        },
        {
          :name => "深海任務部隊 海峡守備残存部隊",
          :point => :N,
          :index => [14]
        },
        {
          :name => "深海任務部隊 飴玉護衛空母I群",
          :point => :O,
          :index => [15]
        },
        {
          :name => "深海任務部隊 飴玉護衛空母II群",
          :point => :P,
          :index => [16, 27]
        },
        {
          :name => "深海任務部隊 飴玉護衛空母III群",
          :point => :Q,
          :index => [17]
        },
        {
          :name => "深海任務部隊 上陸支援部隊",
          :point => :R,
          :index => [18]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :T,
          :index => [20]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :V,
          :index => [22]
        },
        {
          :name => "深海任務部隊 機動部隊群",
          :point => :W,
          :index => [23]
        },
        {
          :name => "深海レイテ侵攻 主力輸送船団",
          :point => :X,
          :index => [30],
          :boss => true
        }
      ],
      :map => "MapE-4Winter2018.png"
    },
    415 => {
      :name => "オルモック沖",
      :cells => [
        {
          :name => "深海任務部隊 艦載機群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海潜水艦部隊 増援阻止線",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :D,
          :index => [4, 13, 14]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海任務部隊 増援迎撃戦隊B群",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海任務部隊 増援迎撃戦隊A群",
          :point => :J,
          :index => [10]
        },
        {
          :name => "深海任務部隊 増援迎撃戦隊旗艦",
          :point => :L,
          :index => [12]
        },
        {
          :name => "深海任務部隊 残存旧式戦艦群",
          :point => :M,
          :index => [16]
        },
        {
          :name => "深海任務部隊 飴玉残存空母A群",
          :point => :N,
          :index => [17, 24]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :O,
          :index => [18]
        },
        {
          :name => "深海任務部隊 収容部隊前衛群",
          :point => :P,
          :index => [19, 25]
        },
        {
          :name => "深海任務部隊 飴玉残存空母B群",
          :point => :R,
          :index => [21]
        },
        {
          :name => "深海任務部隊 増援迎撃戦隊旗艦",
          :point => :T,
          :index => [23],
          :boss => true
        }
      ],
      :map => "MapE-5Winter2018.png"
    },
    416 => {
      :name => "サマール沖東方",
      :cells => [
        {
          :name => "深海任務部隊 艦載機群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海任務部隊 再編水雷戦隊",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海潜水艦部隊 独立強襲群",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海任務部隊 残存輸送船団",
          :point => :I,
          :index => [9]
        },
        {
          :name => "深海任務部隊 再編巡洋艦戦隊",
          :point => :J,
          :index => [10]
        },
        {
          :name => "深海任務部隊 再編空母打撃群",
          :point => :K,
          :index => [11]
        },
        {
          :name => "深海任務部隊 残存輸送船団護衛",
          :point => :L,
          :index => [12]
        },
        {
          :name => "深海任務部隊 再編飴玉空母部隊",
          :point => :O,
          :index => [15, 20]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :P,
          :index => [16]
        },
        {
          :name => "深海任務部隊 増援索敵集団",
          :point => :U,
          :index => [18]
        },
        {
          :name => "深海任務部隊 増援支援集団前衛",
          :point => :Q,
          :index => [22]
        },
        {
          :name => "深海任務部隊 増援支援集団",
          :point => :V,
          :index => [24]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :R,
          :index => [25]
        },
        {
          :name => "深海任務部隊 増援集団旗艦艦隊",
          :point => :W,
          :index => [26],
          :boss => true
        }
      ],
      :map => "MapE-6Winter2018.png"
    },
    417 => {
      :name => "エンガノ岬沖",
      :cells => [
        {
          :name => "深海潜水艦部隊 岬沖再配備集団",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海任務部隊 岬沖艦隊前衛 I群",
          :point => :D,
          :index => [4, 34]
        },
        {
          :name => "深海岬沖艦隊 哨戒護衛空母群",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海任務部隊 岬沖水雷戦隊",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海潜水艦部隊 親衛艦隊I群",
          :point => :H,
          :index => [8, 33, 35]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :I,
          :index => [9, 20]
        },
        {
          :name => "深海岬沖艦隊 前衛哨戒空母群",
          :point => :K,
          :index => [11, 21]
        },
        {
          :name => "深海任務部隊 岬艦隊空母第IV群",
          :point => :L,
          :index => [12]
        },
        {
          :name => "深海任務部隊 岬艦隊空母第III群",
          :point => :M,
          :index => [13, 22, 23]
        },
        {
          :name => "深海潜水艦部隊 親衛艦隊II群",
          :point => :N,
          :index => [14]
        },
        {
          :name => "深海任務部隊 岬艦隊空母第I群",
          :point => :Q,
          :index => [17, 29]
        },
        {
          :name => "深海任務部隊 艦載機群",
          :point => :S,
          :index => [25]
        },
        {
          :name => "深海任務部隊 岬艦隊空母第II群",
          :point => :T,
          :index => [26, 30]
        },
        {
          :name => "深海岬沖艦隊 支援集団随伴護衛",
          :point => :U,
          :index => [27]
        },
        {
          :name => "深海任務部隊 岬沖艦隊支援集団",
          :point => :V,
          :index => [28]
        },
        {
          :name => "深海岬沖艦隊 総旗艦随伴護衛",
          :point => :W,
          :index => [31]
        },
        {
          :name => "深海任務部隊 岬沖艦隊総旗艦",
          :point => :X,
          :index => [32],
          :boss => true
        }
      ],
      :map => "MapE-7Winter2018.png"
    },
    421 => {
      :name => "南西作戦海域方面 バリ島沖",
      :cells => [
        {
          :name => "深海通商破壊部隊 前衛A群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "",
          :point => :B,
          :index => [2]
        },
        {
          :name => "",
          :point => :C,
          :index => [3]
        },
        {
          :name => "",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海通商破壊部隊 前衛B群",
          :point => :E,
          :index => [5, 10, 11, 12]
        },
        {
          :name => "深海通商破壊部隊 支援補給群",
          :point => :F,
          :index => [6, 13]
        },
        {
          :name => "深海駆逐隊",
          :point => :G,
          :index => [7, 14]
        },
        {
          :name => "",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海通商破壊部隊 指揮潜水艦",
          :point => :I,
          :index => [9],
          :boss => true
        }
      ],
      :map => "MapHDE-1Summer2018.png"
    },
    422 => {
      :name => "西方作戦海域方面 マラッカ海峡北方",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1]
        },
        {
          :name => "海峡封鎖 深海戦艦部隊",
          :point => :B,
          :index => [2]
        },
        {
          :name => "海峡警備 深海水雷戦隊",
          :point => :C,
          :index => [3]
        },
        {
          :name => "海峡封鎖 深海遊撃部隊",
          :point => :D,
          :index => [4, 10, 19]
        },
        {
          :name => "深海集積地プーケット航空隊",
          :point => :E,
          :index => [5, 17]
        },
        {
          :name => "",
          :point => :F,
          :index => [6]
        },
        {
          :name => "",
          :point => :G,
          :index => [7]
        },
        {
          :name => "",
          :point => :H,
          :index => [8]
        },
        {
          :name => "海峡警備 深海重巡戦隊",
          :point => :I,
          :index => [9]
        },
        {
          :name => "深海潜水艦隊 海峡封鎖A群",
          :point => :J,
          :index => [11]
        },
        {
          :name => "",
          :point => :K,
          :index => [12]
        },
        {
          :name => "",
          :point => :L,
          :index => [13]
        },
        {
          :name => "海峡前線集積地 防衛艦隊",
          :point => :M,
          :index => [14, 18]
        },
        {
          :name => "深海潜水艦隊 海峡封鎖B群",
          :point => :N,
          :index => [15]
        },
        {
          :name => "深海前線集積地 本部",
          :point => :O,
          :index => [16],
          :boss => true
        }
      ],
      :map => "MapHDE-2Summer2018.png"
    },
    423 => {
      :name => "西方作戦海域方面 セイロン島南西沖",
      :cells => [
        {
          :name => "",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海潜水艦隊 前方展開群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海前線泊地艦隊 前衛水雷戦隊",
          :point => :C,
          :index => [3, 14]
        },
        {
          :name => "深海前線泊地艦隊 高速機動部隊",
          :point => :D,
          :index => [4, 15]
        },
        {
          :name => "",
          :point => :E,
          :index => [5, 16]
        },
        {
          :name => "",
          :point => :F,
          :index => [6, 17, 18]
        },
        {
          :name => "",
          :point => :G,
          :index => [7]
        },
        {
          :name => "",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海東方増派潜水艦隊 I群",
          :point => :I,
          :index => [9]
        },
        {
          :name => "海峡封鎖 深海戦艦部隊",
          :point => :J,
          :index => [10, 19, 20]
        },
        {
          :name => "深海東方増派潜水艦隊 II群",
          :point => :K,
          :index => [11]
        },
        {
          :name => "",
          :point => :L,
          :index => [12, 26]
        },
        {
          :name => "セイロン島南部 深海占拠港湾",
          :point => :M,
          :index => [13, 21]
        },
        {
          :name => "深海前線葉艦棲泊地 航空隊",
          :point => :N,
          :index => [22]
        },
        {
          :name => "深海前線葉艦棲泊地 警備艦隊",
          :point => :O,
          :index => [23, 27, 28]
        },
        {
          :name => "深海前線葉艦棲泊地 航空隊",
          :point => :P,
          :index => [24]
        },
        {
          :name => "深海前線葉艦棲泊地",
          :point => :Q,
          :index => [25],
          :boss => true
        }
      ],
      :map => "MapHDE-3Summer2018.png"
    },
    424 => {
      :name => "欧州作戦海域方面 地中海マルタ島沖",
      :cells => [
        {
          :name => "深海地中海艦隊 前衛潜水艦群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海地中海艦隊 前衛警戒部隊",
          :point => :B,
          :index => [2, 14]
        },
        {
          :name => "深海地中海艦隊 前衛機動部隊",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海地中海艦隊 地域警備隊",
          :point => :D,
          :index => [4, 15]
        },
        {
          :name => "",
          :point => :E,
          :index => [5, 16]
        },
        {
          :name => "",
          :point => :F,
          :index => [6, 17]
        },
        {
          :name => "深海地中海艦隊 タラント補給船団",
          :point => :G,
          :index => [7]
        },
        {
          :name => "",
          :point => :H,
          :index => [8, 18]
        },
        {
          :name => "深海地中海艦隊 軽空母部隊a群",
          :point => :I,
          :index => [9]
        },
        {
          :name => "深海地中海艦隊 軽空母部隊b群",
          :point => :J,
          :index => [10, 25]
        },
        {
          :name => "",
          :point => :K,
          :index => [11]
        },
        {
          :name => "深海地中海艦隊 戦艦戦隊",
          :point => :L,
          :index => [12]
        },
        {
          :name => "",
          :point => :M,
          :index => [13]
        },
        {
          :name => "深海地中海艦隊 マルタ島兵站線",
          :point => :N,
          :index => [19]
        },
        {
          :name => "深海地中海艦隊 ナポリ占拠集団",
          :point => :O,
          :index => [20, 24]
        },
        {
          :name => "深海潜水艦マルタ島集団 II群",
          :point => :P,
          :index => [21]
        },
        {
          :name => "深海地中海艦隊 基地航空隊",
          :point => :Q,
          :index => [22]
        },
        {
          :name => "深海潜水艦マルタ島集団 I群",
          :point => :R,
          :index => [23]
        },
        {
          :name => "深海地中海艦隊 タラント集積拠点",
          :point => :S,
          :index => [27]
        },
        {
          :name => "深海地中海艦隊 増派機動部隊",
          :point => :T,
          :index => [28, 30]
        },
        {
          :name => "深海地中海艦隊 ジェノヴァ船渠",
          :point => :U,
          :index => [29, 33],
          :boss => true
        },
        {
          :name => "深海地中海艦隊 緊急展開部隊",
          :point => :V,
          :index => [31]
        },
        {
          :name => "深海地中海艦隊 基地航空隊",
          :point => :W,
          :index => [32, 34]
        }
      ],
      :map => "MapHDE-4Summer2018.png"
    },
    425 => {
      :name => "欧州作戦海域方面 北海/北大西洋海域",
      :cells => [
        {
          :name => "深海北大西洋艦隊 機動部隊III群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "北大西洋深海旗艦艦隊 攻撃隊",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海北大西洋艦隊 潜水艦集団",
          :point => :C,
          :index => [3]
        },
        {
          :name => "",
          :point => :D,
          :index => [4, 11]
        },
        {
          :name => "深海北大西洋艦隊 機動部隊II群",
          :point => :E,
          :index => [5]
        },
        {
          :name => "",
          :point => :F,
          :index => [6]
        },
        {
          :name => "",
          :point => :G,
          :index => [7, 12]
        },
        {
          :name => "深海北大西洋艦隊 戦艦戦隊I群",
          :point => :H,
          :index => [8, 36]
        },
        {
          :name => "深海北大西洋艦隊 機動部隊I群",
          :point => :I,
          :index => [9, 27]
        },
        {
          :name => "北大西洋深海通商破壊主力部隊",
          :point => :J,
          :index => [10, 13]
        },
        {
          :name => "深海北大西洋艦隊 機動部隊群",
          :point => :K,
          :index => [14, 28]
        },
        {
          :name => "北大西洋深海艦隊 重雷装戦隊",
          :point => :L,
          :index => [15, 29]
        },
        {
          :name => "深海北大西洋艦隊 戦艦戦隊II群",
          :point => :M,
          :index => [16]
        },
        {
          :name => "",
          :point => :N,
          :index => [17]
        },
        {
          :name => "",
          :point => :O,
          :index => [18]
        },
        {
          :name => "深海北大西洋艦隊 追撃空母群",
          :point => :P,
          :index => [19]
        },
        {
          :name => "",
          :point => :Q,
          :index => [20]
        },
        {
          :name => "",
          :point => :R,
          :index => [21, 30]
        },
        {
          :name => "深海ドーバー海峡封鎖潜水艦群",
          :point => :S,
          :index => [22]
        },
        {
          :name => "深海北海潜水艦隊集団",
          :point => :T,
          :index => [23]
        },
        {
          :name => "",
          :point => :U,
          :index => [24]
        },
        {
          :name => "",
          :point => :V,
          :index => [25]
        },
        {
          :name => "北大西洋深海艦隊 ブレスト軍港",
          :point => :W,
          :index => [26]
        },
        {
          :name => "",
          :point => :X,
          :index => [32, 38]
        },
        {
          :name => "北大西洋深海旗艦艦隊 前衛集団",
          :point => :Y,
          :index => [33]
        },
        {
          :name => "",
          :point => :Z,
          :index => [34, 39]
        },
        {
          :name => "北大西洋深海艦隊 旗艦艦隊",
          :point => :Z2,
          :index => [35, 40],
          :boss => true
        },
        {
          :name => "北大西洋深海旗艦艦隊 攻撃隊",
          :point => :Z3,
          :index => [37]
        }
      ],
      :map => "MapHDE-5Summer2018.png"
    },
    431 => {
      :name => "ブラケット水道/クラ湾沖",
      :cells => [
        #{
        #  :name => "",
        #  :point => :A,
        #  :index => [1]
        #},
        {
          :name => "深海ソロモン艦隊 潜水艦哨戒線",
          :point => :B,
          :index => [2, 8]
        },
        {
          :name => "深海ソロモン艦隊 前衛警戒隊",
          :point => :C,
          :index => [3, 9, 16]
        },
        {
          :name => "深海ソロモン魚雷艇戦隊",
          :point => :D,
          :index => [4]
        },
        {
          :name => "ブラケット水道 侵入深海駆逐隊",
          :point => :E,
          :index => [5, 10]
        },
        #{
        #  :name => "",
        #  :point => :F,
        #  :index => [6]
        #},
        {
          :name => "深海ソロモン任務部隊 先遣隊",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海ソロモン艦隊 警戒駆逐隊",
          :point => :H,
          :index => [11]
        },
        {
          :name => "深海新型装備駆逐隊 第II群",
          :point => :I,
          :index => [12]
        },
        {
          :name => "深海新型装備駆逐隊 第I群",
          :point => :J,
          :index => [13]
        },
        # {
        #   :name => "",
        #   :point => :K,
        #   :index => [14]
        # },
        {
          :name => "深海ソロモン任務部隊 クラ湾主力",
          :point => :L,
          :index => [15, 17, 18],
          :boss => true
        }
      ],
      :map => "MapHDE-1Winter2019.png"
    },
    432 => {
      :name => "ラバウル/中部ソロモン海域",
      :cells => [
        {
          :name => "リコリス飛行場 基地航空隊",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海潜水艦隊 ラバウル警戒隊",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海待ち伏せ展開部隊 前衛戦隊",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海水雷戦隊 前衛警戒隊",
          :point => :D,
          :index => [4]
        },
        # {
        #   :name => "",
        #   :point => :E,
        #   :index => [5, 12]
        # },
        {
          :name => "深海水雷戦隊 重雷装隊",
          :point => :F,
          :index => [6, 13, 14, 15, 16]
        },
        # {
        #   :name => "",
        #   :point => :G,
        #   :index => [7, 17]
        # },
        # {
        #   :name => "",
        #   :point => :H,
        #   :index => [8]
        # },
        {
          :name => "深海戦艦部隊 前衛集団",
          :point => :I,
          :index => [9, 31]
        },
        {
          :name => "深海ソロモン艦隊 重巡戦隊 前衛",
          :point => :J,
          :index => [10]
        },
        {
          :name => "深海ソロモン艦隊 重巡戦隊 旗艦",
          :point => :K,
          :index => [11]
        },
        {
          :name => "リコリス飛行場 基地航空隊",
          :point => :L,
          :index => [18, 32]
        },
        {
          :name => "深海戦艦部隊 水上打撃集団",
          :point => :M,
          :index => [19, 36]
        },
        {
          :name => "リコリス飛行場 基地航空隊",
          :point => :N,
          :index => [20]
        },
        # {
        #   :name => "",
        #   :point => :O,
        #   :index => [21]
        # },
        {
          :name => "深海ソロモン艦隊 旗艦展開泊地",
          :point => :P,
          :index => [22, 37],
          :boss => true
        },
        {
          :name => "深海ソロモン配備 魚雷艇集団",
          :point => :Q,
          :index => [23]
        },
        {
          :name => "深海ソロモン派遣 空母任務部隊",
          :point => :R,
          :index => [24]
        },
        {
          :name => "深海待ち伏せ展開部隊 主力戦隊",
          :point => :S,
          :index => [25]
        },
        {
          :name => "深海ソロモン派遣 空母任務部隊",
          :point => :T,
          :index => [26]
        },
        {
          :name => "深海任務部隊 上陸支援打撃群",
          :point => :U,
          :index => [27, 33, 34]
        },
        {
          :name => "リコリス飛行場 基地航空隊",
          :point => :V,
          :index => [28]
        },
        {
          :name => "深海ブイン攻略任務群 上陸船団",
          :point => :W,
          :index => [29]
        },
        # {
        #   :name => "",
        #   :point => :X,
        #   :index => [30]
        # }
      ],
      :map => "MapHDE-2Winter2019.png"
    },
    433 => {
      :name => "中部ソロモン海域 ブーゲンビル島沖",
      :cells => [
        # {
        #   :name => "",
        #   :point => :A,
        #   :index => [1]
        # },
        {
          :name => "深海レーダー射撃 重巡戦隊",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海潜水艦隊 増援阻止線",
          :point => :C,
          :index => [3, 36]
        },
        {
          :name => "リコリス飛行場 基地航空隊",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海巡洋艦部隊 前衛警戒隊",
          :point => :E,
          :index => [5]
        },
        {
          :name => "リコリス飛行場 基地航空隊",
          :point => :F,
          :index => [6, 20]
        },
        # {
        #   :name => "",
        #   :point => :G,
        #   :index => [7, 21]
        # },
        # {
        #   :name => "",
        #   :point => :H,
        #   :index => [8, 22]
        # },
        {
          :name => "リコリス飛行場 基地航空隊",
          :point => :I,
          :index => [9, 23]
        },
        {
          :name => "深海ソロモン艦隊 前衛集団",
          :point => :J,
          :index => [10]
        },
        {
          :name => "リコリス飛行場 基地航空隊",
          :point => :K,
          :index => [11]
        },
        {
          :name => "深海ソロモン艦隊 重巡戦隊 前衛",
          :point => :L,
          :index => [12]
        },
        # {
        #   :name => "",
        #   :point => :M,
        #   :index => [13]
        # },
        {
          :name => "リコリス飛行場 基地航空隊",
          :point => :N,
          :index => [14, 24]
        },
        {
          :name => "深海ブイン攻略部隊 火力支援群",
          :point => :O,
          :index => [15]
        },
        # {
        #   :name => "",
        #   :point => :P,
        #   :index => [16, 25, 26]
        # },
        {
          :name => "深海ソロモン配備 魚雷艇教導団",
          :point => :Q,
          :index => [17]
        },
        {
          :name => "深海レーダー射撃 戦艦戦隊",
          :point => :R,
          :index => [18]
        },
        {
          :name => "深海ブイン攻略部隊 支援艦隊",
          :point => :S,
          :index => [19]
        },
        {
          :name => "リコリス飛行場 基地航空隊",
          :point => :T,
          :index => [27, 34]
        },
        {
          :name => "深海ソロモン派遣 空母任務部隊",
          :point => :U,
          :index => [28]
        },
        {
          :name => "深海任務部隊 上陸支援打撃群",
          :point => :V,
          :index => [29]
        },
        {
          :name => "深海ソロモン派遣 機動部隊群",
          :point => :W,
          :index => [30]
        },
        # {
        #   :name => "",
        #   :point => :X,
        #   :index => [31]
        # },
        # {
        #   :name => "",
        #   :point => :Y,
        #   :index => [32]
        # },
        {
          :name => "深海ブイン攻略部隊 旗艦艦隊",
          :point => :Z,
          :index => [33, 35, 38],
          :boss => true
        },
        {
          :name => "深海ブイン旗艦艦隊 護衛潜水群",
          :point => :ZZ,
          :index => [37]
        }
      ],
      :map => "MapHDE-3Winter2019.png"
    },
    441 => {
      :name => "津軽海峡/北海道沖/南千島沖",
      :cells => [
        {
          :name => "浸透深海潜水艦隊 IV群",
          :point => :A,
          :index => [1]
        },
        # {
        #   :name => "",
        #   :point => :B,
        #   :index => [2]
        # },
        {
          :name => "浸透潜水艦隊 支援群",
          :point => :C,
          :index => [3, 22]
        },
        # {
        #   :name => "",
        #   :point => :D,
        #   :index => [4]
        # },
        {
          :name => "浸透潜水艦隊 支援群本体",
          :point => :E,
          :index => [5]
        },
        {
          :name => "浸透深海潜水艦隊 I群",
          :point => :F,
          :index => [6, 23]
        },
        # {
        #   :name => "",
        #   :point => :G,
        #   :index => [7]
        # },
        # {
        #   :name => "",
        #   :point => :H,
        #   :index => [8]
        # },
        {
          :name => "浸透深海潜水艦隊 III群",
          :point => :I,
          :index => [9]
        },
        {
          :name => "浸透深海潜水艦隊 II群",
          :point => :J,
          :index => [10]
        },
        {
          :name => "強行偵察水雷戦隊 C群",
          :point => :K,
          :index => [11]
        },
        # {
        #   :name => "",
        #   :point => :L,
        #   :index => [12, 24, 25]
        # },
        {
          :name => "浸透深海潜水艦隊 II群",
          :point => :M,
          :index => [13]
        },
        # {
        #   :name => "",
        #   :point => :N,
        #   :index => [14]
        # },
        {
          :name => "深海高速浸透任務部隊 前衛群",
          :point => :O,
          :index => [15]
        },
        {
          :name => "浸透深海潜水艦隊 I群",
          :point => :P,
          :index => [16]
        },
        {
          :name => "強行偵察水雷戦隊 B群",
          :point => :Q,
          :index => [17]
        },
        # {
        #   :name => "",
        #   :point => :R,
        #   :index => [18]
        # },
        {
          :name => "強行偵察水雷戦隊 A群",
          :point => :S,
          :index => [19]
        },
        {
          :name => "浸透深海潜水艦隊 泊地封鎖部隊",
          :point => :T,
          :index => [20]
        },
        {
          :name => "",
          :point => :U,
          :index => [21]
        },
        {
          :name => "深海高速浸透任務部隊 支援隊",
          :point => :V,
          :index => [26]
        },
        {
          :name => "深海水雷戦隊 前衛警戒隊",
          :point => :W,
          :index => [27, 28],
          :boss => true
        }
      ],
      :map => "MapHDE-1Spring2019.png"
    },
    442 => {
      :name => "九州南部/南西諸島沖",
      :cells => [
        # {
        #   :name => "",
        #   :point => :A,
        #   :index => [1]
        # },
        {
          :name => "任務部隊 艦載機群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "任務部隊 艦載機群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "任務部隊 外周ピケット艦隊 A群",
          :point => :D,
          :index => [4, 14]
        },
        {
          :name => "任務部隊 艦載機群",
          :point => :E,
          :index => [5, 34, 35]
        },
        {
          :name => "任務部隊 外周ピケット艦隊 B群",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海任務部隊 別働群",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海任務部隊 護衛集団II群",
          :point => :H,
          :index => [8, 36]
        },
        {
          :name => "深海潜水艦隊 通商破壊集団",
          :point => :I,
          :index => [9, 15, 16]
        },
        {
          :name => "攻略部隊 前衛護衛水雷戦隊",
          :point => :J,
          :index => [10, 17, 18]
        },
        # {
        #   :name => "",
        #   :point => :K,
        #   :index => [11]
        # },
        {
          :name => "深海攻略部隊 主力集団",
          :point => :L,
          :index => [12]
        },
        # {
        #   :name => "",
        #   :point => :M,
        #   :index => [13]
        # },
        {
          :name => "深海潜水艦隊 前進哨戒線",
          :point => :N,
          :index => [19]
        },
        # {
        #   :name => "",
        #   :point => :O1,
        #   :index => [20]
        # },
        # {
        #   :name => "",
        #   :point => :O2,
        #   :index => [21]
        # },
        {
          :name => "任務部隊 艦載機群",
          :point => :O3,
          :index => [22]
        },
        {
          :name => "任務部隊 艦載機群",
          :point => :P1,
          :index => [23]
        },
        {
          :name => "任務部隊 艦載機群",
          :point => :P2,
          :index => [24]
        },
        {
          :name => "深海潜水艦隊 精鋭部隊",
          :point => :P3,
          :index => [25]
        },
        {
          :name => "任務部隊 艦載機群",
          :point => :Q1,
          :index => [26]
        },
        {
          :name => "任務部隊 艦載機群",
          :point => :Q2,
          :index => [27, 37]
        },
        {
          :name => "任務部隊 艦載機群",
          :point => :Q3,
          :index => [28, 38]
        },
        {
          :name => "任務部隊 艦載機群",
          :point => :R,
          :index => [29, 39]
        },
        {
          :name => "深海任務部隊 護衛集団II群",
          :point => :S,
          :index => [30, 40]
        },
        {
          :name => "深海任務部隊 戦艦戦隊",
          :point => :T,
          :index => [31, 41]
        },
        {
          :name => "深海任務部隊 侵攻旗艦艦隊",
          :point => :U,
          :index => [32],
          :boss => true
        },
        # {
        #   :name => "",
        #   :point => :V,
        #   :index => [33]
        # }
      ],
      :map => "MapHDE-2Spring2019.png"
    },
    443 => {
      :name => "アリューシャン列島沖",
      :cells => [
        {
          :name => "深海北方潜水艦隊 前方展開A群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海北方艦隊 警戒部隊I群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海北方潜水艦隊 前方展開B群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海北方艦隊 警戒部隊II群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海北方基地 航空隊",
          :point => :E,
          :index => [5]
        },
        # {
        #   :name => "",
        #   :point => :F,
        #   :index => [6, 15]
        # },
        {
          :name => "深海北方基地 航空隊",
          :point => :G,
          :index => [7]
        },
        # {
        #   :name => "",
        #   :point => :H,
        #   :index => [8, 16, 29]
        # },
        {
          :name => "深海北方基地 航空隊",
          :point => :I,
          :index => [9, 17]
        },
        {
          :name => "深海北方艦隊 機動部隊",
          :point => :J,
          :index => [10, 18]
        },
        {
          :name => "深海北方艦隊 巡洋艦戦隊",
          :point => :K,
          :index => [11, 19]
        },
        {
          :name => "深海北方艦隊 高速戦艦戦隊",
          :point => :L,
          :index => [12, 20, 21]
        },
        # {
        #   :name => "",
        #   :point => :M,
        #   :index => [13]
        # },
        {
          :name => "深海北方艦隊 遊撃部隊主力",
          :point => :N,
          :index => [14]
        },
        {
          :name => "深海北方艦隊 拠点防衛部隊",
          :point => :O,
          :index => [22, 26]
        },
        {
          :name => "深海北方基地 航空隊",
          :point => :P,
          :index => [23, 27]
        },
        # {
        #   :name => "",
        #   :point => :Q,
        #   :index => [24]
        # },
        {
          :name => "深海北方艦隊 拠点基地",
          :point => :R,
          :index => [25, 30],
          :boss => true
        },
        {
          :name => "深海北方潜水艦隊 緊急展開部隊",
          :point => :S,
          :index => [28]
        }
      ],
      :map => "MapHDE-3Spring2019.png"
    },
    444 => {
      :name => "北太平洋ハワイ諸島戦域",
      :cells => [
        # {
        #   :name => "",
        #   :point => :A,
        #   :index => [1]
        # },
        {
          :name => "深海太平洋潜水艦隊 B群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海太平洋潜水艦隊 C群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海機動部隊A群 艦載機群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海太平洋潜水艦隊 D群",
          :point => :E,
          :index => [5]
        },
        {
          :name => "深海太平洋中枢泊地 航空隊",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海機動部隊A群 随伴護衛部隊",
          :point => :G,
          :index => [7, 23]
        },
        {
          :name => "深海太平洋中枢艦隊 前衛展開群",
          :point => :H,
          :index => [8, 24]
        },
        {
          :name => "深海太平洋潜水艦隊 A群",
          :point => :I,
          :index => [9, 25]
        },
        {
          :name => "深海機動部隊A群 主隊",
          :point => :J,
          :index => [10, 26]
        },
        {
          :name => "深海機動部隊B群 艦載機群",
          :point => :K,
          :index => [11, 43, 44]
        },
        {
          :name => "深海太平洋中枢泊地 航空隊",
          :point => :L,
          :index => [12, 27]
        },
        {
          :name => "深海機動部隊B群 艦載機群",
          :point => :M,
          :index => [13]
        },
        {
          :name => "深海太平洋中枢艦隊 遊撃部隊",
          :point => :N,
          :index => [14]
        },
        {
          :name => "深海太平洋中枢泊地 駐留艦隊",
          :point => :O,
          :index => [15, 28, 29, 30, 31, 45]
        },
        {
          :name => "深海機動部隊B群 随伴護衛部隊",
          :point => :P,
          :index => [16, 32]
        },
        {
          :name => "深海太平洋兵站輸送部隊 護衛群",
          :point => :Q,
          :index => [17]
        },
        {
          :name => "深海太平洋中枢泊地 航空隊",
          :point => :R,
          :index => [18, 33]
        },
        {
          :name => "深海機動部隊B群 主隊",
          :point => :S,
          :index => [19, 34, 35, 46]
        },
        {
          :name => "深海太平洋兵站輸送部隊",
          :point => :T,
          :index => [20]
        },
        # {
        #   :name => "",
        #   :point => :U,
        #   :index => [21, 36]
        # },
        {
          :name => "深海太平洋中枢泊地 占領司令部",
          :point => :V,
          :index => [22, 37],
          :boss => true
        },
        {
          :name => "深海太平洋潜水艦隊 緊急展開群",
          :point => :W,
          :index => [39]
        },
        {
          :name => "深海太平洋中枢泊地 任務部隊群",
          :point => :X,
          :index => [40, 42]
        },
        {
          :name => "深海太平洋中枢泊地 航空隊",
          :point => :Y,
          :index => [41]
        }
      ],
      :map => "MapHDE-4Spring2019.png"
    },
    445 => {
      :name => "北太平洋ハワイ諸島南東沖",
      :cells => [
        {
          :name => "深海任務部隊 強行偵察艦隊",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海太平洋潜水艦隊 再編成B群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海太平洋潜水艦隊 再編成A群",
          :point => :C,
          :index => [3, 18]
        },
        # {
        #   :name => "",
        #   :point => :D,
        #   :index => [4, 43]
        # },
        {
          :name => "深海太平洋深淵任務群 航空隊",
          :point => :E,
          :index => [5]
        },
        {
          :name => "深海任務部隊　艦載機群",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海任務部隊　艦載機群",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海任務部隊　増派護衛空母B群",
          :point => :H,
          :index => [8, 19, 20]
        },
        {
          :name => "深海任務部隊 前衛警戒部隊",
          :point => :I,
          :index => [9, 21]
        },
        # {
        #   :name => "",
        #   :point => :J,
        #   :index => [10, 22, 44]
        # },
        {
          :name => "深海任務部隊　増派護衛空母A群",
          :point => :K,
          :index => [11, 23, 45]
        },
        {
          :name => "深海任務部隊　増派水上打撃部隊",
          :point => :L,
          :index => [12]
        },
        {
          :name => "深海任務部隊 逆上陸部隊 I群",
          :point => :M,
          :index => [13, 46]
        },
        {
          :name => "深海任務部隊 逆上陸部隊 II群",
          :point => :N,
          :index => [14, 47]
        },
        # {
        #   :name => "",
        #   :point => :O,
        #   :index => [15]
        # },
        # {
        #   :name => "",
        #   :point => :P,
        #   :index => [16]
        # },
        {
          :name => "深海太平洋深淵任務群 出撃艦隊",
          :point => :Q,
          :index => [17, 24]
        },
        {
          :name => "深海太平洋深淵潜水艦隊",
          :point => :R,
          :index => [25]
        },
        {
          :name => "深海太平洋深淵任務群 航空隊",
          :point => :S,
          :index => [26]
        },
        # {
        #   :name => "",
        #   :point => :T,
        #   :index => [27]
        # },
        {
          :name => "深海太平洋深淵任務群 戦艦戦隊",
          :point => :U,
          :index => [28]
        },
        {
          :name => "深海太平洋深淵任務群 強襲部隊",
          :point => :V,
          :index => [29]
        },
        {
          :name => "深海太平洋深淵任務群 航空隊",
          :point => :W,
          :index => [30, 36]
        },
        {
          :name => "深海太平洋深淵任務群 強襲部隊",
          :point => :X,
          :index => [31, 37, 38, 39]
        },
        {
          :name => "深海太平洋深淵任務群 戦艦戦隊",
          :point => :Y,
          :index => [32]
        },
        {
          :name => "深海太平洋深淵任務群 旗艦艦隊",
          :point => :Z,
          :index => [33, 40],
          :boss => true
        },
        # {
        #   :name => "",
        #   :point => :Z1,
        #   :index => [34]
        # },
        # {
        #   :name => "",
        #   :point => :Z2,
        #   :index => [35]
        # },
        # {
        #   :name => "",
        #   :point => :J2,
        #   :index => [41]
        # },
        # {
        #   :name => "",
        #   :point => :AD,
        #   :index => [42]
        # }
      ],
      :map => "MapHDE-5Spring2019.png"
    },
    451 => {
      :name => "北大西洋ブレスト沖",
      :cells => [
        {
          :name => "深海北大西洋潜水艦部隊 II群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "深海北大 西洋艦隊 水雷戦隊B群",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海北大西洋艦隊 前衛水雷戦隊",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海北大西洋潜水艦部隊 I群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "",
          :point => :E,
          :index => [5]
        },
        {
          :name => "",
          :point => :F,
          :index => [6, 13]
        },
        {
          :name => "深海北大西洋 攻略部隊随伴護衛",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海北大西洋艦隊 水雷戦隊A群",
          :point => :H,
          :index => [8]
        },
        {
          :name => "",
          :point => :I,
          :index => [9]
        },
        {
          :name => "",
          :point => :J,
          :index => [10]
        },
        {
          :name => "深海北大西洋 攻略揚陸部隊",
          :point => :K,
          :index => [11]
        },
        {
          :name => "深海北大西洋巡洋艦戦隊",
          :point => :L,
          :index => [12, 16]
        },
        {
          :name => "深海ブレスト侵攻 前衛潜水艦隊",
          :point => :M,
          :index => [14,17]
        },
        {
          :name => "深海ブレスト侵攻艦隊 旗艦",
          :point => :N,
          :boss => true,
          :index => [15,18]
        }
      ],
      :map => "MapHDE-1Summer2019.png"
    },
    452 => {
      :name => "ジブラルタル海峡沖/地中海",
      :cells => [
        {
          :name => "深海北大西洋 警戒部隊 B群",
          :point => :A,
          :index => [1]
        },
        {
          :name => "",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海北大西洋群狼部隊 II群",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海北大西洋群狼部隊 II群",
          :point => :D,
          :index => [4]
        },
        {
          :name => "深海北大西洋 警戒巡洋艦戦隊",
          :point => :E,
          :index => [5]
        },
        {
          :name => "深海北大西洋 警戒部隊 A群",
          :point => :F,
          :index => [6]
        },
        {
          :name => "深海ジブラルタル港湾 駐屯艦隊",
          :point => :G,
          :index => [7, 15,16]
        },
        {
          :name => "",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海ジブラルタル潜水艦隊",
          :point => :I,
          :index => [9,17]
        },
        {
          :name => "深海ジブラルタル港湾 駐屯艦隊",
          :point => :J,
          :index => [10]
        },
        {
          :name => "深海ジブラルタル港湾 駐屯艦隊",
          :point => :K,
          :index => [11,18,19]
        },
        {
          :name => "",
          :point => :L,
          :index => [12]
        },
        {
          :name => "",
          :point => :M,
          :index => [13,20]
        },
        {
          :name => "深海ジブラルタル港湾要塞",
          :point => :N,
          :index => [14]
        },
        {
          :name => "海地中海艦隊 前衛巡洋戦隊",
          :point => :O,
          :index => [21]
        },
        {
          :name => "深海地中海潜水艦隊 前衛部隊",
          :point => :P,
          :index => [22]
        },
        {
          :name => "深海北方基地 航空隊",
          :point => :Q,
          :index => [23]
        },
        {
          :name => "深海地中海艦隊 沿岸警備隊群",
          :point => :R,
          :index => [24]
        },
        {
          :name => "",
          :point => :S,
          :index => [25]
        },
        {
          :name => "深海地中海艦隊 水上打撃部隊",
          :point => :T,
          :index => [26,29]
        },
        {
          :name => "",
          :point => :U,
          :index => [27]
        },
        {
          :name => "深海地中海艦隊 旗艦艦隊",
          :point => :V,
          :boss => true,
          :index => [28,30,31]
        }
      ],
      :map => "MapHDE-2Summer2019.png"
    },
    453 => {
      :name => "地中海/マルタ島沖/アンツィオ沖",
      :cells => [
        {
          :name => "深海地中海艦隊 先遣巡洋戦隊",
          :point => :A,
          :index => [1]
        },
        {
          :name => "",
          :point => :B,
          :index => [2]
        },
        {
          :name => "深海地中海方面 基地航空隊",
          :point => :C,
          :index => [3]
        },
        {
          :name => "深海地中海方面 基地航空隊",
          :point => :D,
          :index => [4,29]
        },
        {
          :name => "深海地中海艦隊 兵站補給基地",
          :point => :E,
          :index => [5]
        },
        {
          :name => "深海地中海潜水艦戦隊",
          :point => :F,
          :index => [6,11,12,30]
        },
        {
          :name => "深海地中海機動部隊 前衛群",
          :point => :G,
          :index => [7]
        },
        {
          :name => "深海地中海方面 基地航空隊",
          :point => :H,
          :index => [8]
        },
        {
          :name => "深海ジブラルタル港湾 駐屯艦隊",
          :point => :I,
          :index => [9,13,14]
        },
        {
          :name => "深海地中海艦隊 マルタ島守備隊",
          :point => :J,
          :index => [10]
        },
        {
          :name => "深海地中海艦隊 戦艦戦隊",
          :point => :K,
          :index => [15,27]
        },
        {
          :name => "",
          :point => :L,
          :index => [16]
        },
        {
          :name => "",
          :point => :M,
          :index => [17,20]
        },
        {
          :name => "深海地中海方面 基地航空隊",
          :point => :N,
          :index => [18]
        },
        {
          :name => "深海地中海艦隊 上陸占領部隊",
          :point => :O,
          :index => [19]
        },
        {
          :name => "深海地中海潜水艦隊 最終防衛線",
          :point => :P,
          :index => [21,31]
        },
        {
          :name => "",
          :point => :Q,
          :index => [22]
        },
        {
          :name => "深海地中海方面 基地航空隊",
          :point => :R,
          :index => [23,28]
        },
        {
          :name => "",
          :point => :S,
          :index => [24]
        },
        {
          :name => "",
          :point => :T,
          :index => [25]
        },
        {
          :name => "深海アンツィオ侵攻部隊 旗艦艦隊",
          :point => :U,
          :index => [26],
          :boss => true
        }
      ],
      :map => "MapHDE-3Summer2019.png"
    },
    461 => {
      :name => @data.find{|x| x["id"] == 461}["name"],
      :map => @data.find{|x| x["id"] == 461}["image"],
      :cells => @data.find{|x| x["id"] == 461}["cells"].filter{|x, y| y["name"] != nil}.map do |x, y|
        {
          :name => y["name"],
          :point => x.to_sym,
          :boss => y["boss"],
          :index => y["routes"]
        }
      end
    },
    462 => {
      :name => @data.find{|x| x["id"] == 462}["name"],
      :map => @data.find{|x| x["id"] == 462}["image"],
      :cells => @data.find{|x| x["id"] == 462}["cells"].filter{|x, y| y["name"] != nil}.map do |x, y|
        {
          :name => y["name"],
          :point => x.to_sym,
          :boss => y["boss"],
          :index => y["routes"]
        }
      end
    },
    463 => {
      :name => @data.find{|x| x["id"] == 463}["name"],
      :map => @data.find{|x| x["id"] == 463}["image"],
      :cells => @data.find{|x| x["id"] == 463}["cells"].filter{|x, y| y["name"] != nil}.map do |x, y|
        {
          :name => y["name"],
          :point => x.to_sym,
          :boss => y["boss"],
          :index => y["routes"]
        }
      end
    },
    464 => {
      :name => @data.find{|x| x["id"] == 464}["name"],
      :map => @data.find{|x| x["id"] == 464}["image"],
      :cells => @data.find{|x| x["id"] == 464}["cells"].filter{|x, y| y["name"] != nil}.map do |x, y|
        {
          :name => y["name"],
          :point => x.to_sym,
          :boss => y["boss"],
          :index => y["routes"]
        }
      end
    },
    465 => {
      :name => @data.find{|x| x["id"] == 465}["name"],
      :map => @data.find{|x| x["id"] == 465}["image"],
      :cells => @data.find{|x| x["id"] == 465}["cells"].filter{|x, y| y["name"] != nil}.map do |x, y|
        {
          :name => y["name"],
          :point => x.to_sym,
          :boss => y["boss"],
          :index => y["routes"]
        }
      end
    },
    466 => {
      :name => @data.find{|x| x["id"] == 466}["name"],
      :map => @data.find{|x| x["id"] == 466}["image"],
      :cells => @data.find{|x| x["id"] == 466}["cells"].filter{|x, y| y["name"] != nil}.map do |x, y|
        {
          :name => y["name"],
          :point => x.to_sym,
          :boss => y["boss"],
          :index => y["routes"]
        }
      end
    }
  }

  def self.map
    @@map
  end
end

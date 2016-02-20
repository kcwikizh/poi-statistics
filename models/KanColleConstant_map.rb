class KanColleConstant
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
      :map => "Map1-1.png"
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
          :name => "敵主力艦隊",
          :point => :B,
          :index => [3],
          :boss => true,
        },
        {
          :name => "敵前衛艦隊",
          :point => :D,
          :index => [4],
        },
      ],
      :map => "Map1-2.png"
    },
    13 => {
      :name => "製油所地帯沿岸",
      :cells => [
        {
          :name => "敵前衛艦隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "敵前衛艦隊",
          :point => :E,
          :index => [5],
        },
        {
          :name => "敵支援艦隊",
          :point => :F,
          :index => [6, 9],
        },
        {
          :name => "敵主力艦隊",
          :point => :G,
          :index => [7],
          :boss => true,
        },
      ],
      :map => "Map1-3.png"
    },
    14 => {
      :name => "南西諸島防衛線",
      :cells => [
        {
          :name => "敵偵察艦隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "敵偵察艦隊",
          :point => :B,
          :index => [2],
        },
        {
          :name => "敵前衛艦隊",
          :point => :E,
          :index => [7],
        },
        {
          :name => "敵前衛艦隊",
          :point => :I,
          :index => [8],
        },
        {
          :name => "敵支援艦隊",
          :point => :J,
          :index => [9],
        },
        {
          :name => "敵機動部隊",
          :point => :F,
          :index => [10, 12, 13],
          :boss => true,
        },
      ],
      :map => "Map1-4.png"
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
          :name => "敵潜水艦隊A群",
          :point => :B,
          :index => [2],
        },
        {
          :name => "敵潜水艦隊B群",
          :point => :D,
          :index => [3],
        },
        {
          :name => "敵潜水艦隊C群",
          :point => :C,
          :index => [4],
        },
        {
          :name => "敵侵攻打撃艦隊A群",
          :point => :F,
          :index => [6],
        },
        {
          :name => "敵侵攻打撃艦隊B群",
          :point => :G,
          :index => [8],
        },
        {
          :name => "敵通商破壊主力艦隊",
          :point => :I,
          :index => [9, 10],
          :boss => true,
        },
      ],
      :map => "Map1-5.png"
    },
    16 => {
      :name => "鎮守府近海航路",
      :cells => [
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
          :name => "任務部隊支援 水上打撃部隊",
          :point => :K,
          :index => [6, 15],
        },
        {
          :name => "任務部隊A群 機動部隊(第一波)",
          :point => :L,
          :index => [8],
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
        },
        {
          :name => "任務部隊C群 機動部隊",
          :point => :F,
          :index => [12],
        },
        {
          :name => "任務部隊C群 前衛部隊",
          :point => :B,
          :index => [13],
        },
      ],
      :map => "Map1-6.png"
    },
    21 => {
      :name => "カムラン半島",
      :cells => [
        {
          :name => "敵前衛部隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "敵護衛空母群",
          :point => :C,
          :index => [4],
        },
        {
          :name => "敵護衛空母群",
          :point => :F,
          :index => [5],
        },
        {
          :name => "敵主力艦隊",
          :point => :E,
          :index => [6],
          :boss => true,
        },
      ],
      :map => "Map2-1.png"
    },
    22 => {
      :name => "バシー島沖",
      :cells => [
        {
          :name => "敵水雷戦隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "敵運送船団",
          :point => :G,
          :index => [4],
        },
        {
          :name => "敵運送船団",
          :point => :D,
          :index => [6],
        },
        {
          :name => "敵通商破壊艦隊",
          :point => :F,
          :index => [7],
          :boss => true,
        },
      ],
      :map => "Map2-2.png"
    },
    23 => {
      :name => "東部オリョール海",
      :cells => [
        {
          :name => "敵巡洋艦隊",
          :point => :C,
          :index => [1],
        },
        {
          :name => "敵強襲揚陸艦隊",
          :point => :H,
          :index => [3],
        },
        {
          :name => "敵巡洋艦隊",
          :point => :B,
          :index => [5],
        },
        {
          :name => "敵強襲揚陸艦隊",
          :point => :K,
          :index => [9],
        },
        {
          :name => "敵強襲揚陸艦隊",
          :point => :F,
          :index => [10],
        },
        {
          :name => "敵主力打撃群",
          :point => :G,
          :index => [11],
          :boss => true,
        },
      ],
      :map => "Map2-3.png"
    },
    24 => {
      :name => "沖ノ島海域",
      :cells => [
        {
          :name => "敵巡洋艦隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "敵水上打撃艦隊",
          :point => :F,
          :index => [3],
        },
        {
          :name => "敵水上打撃艦隊",
          :point => :C,
          :index => [5],
        },
        {
          :name => "敵空母機動部隊",
          :point => :D,
          :index => [6],
        },
        {
          :name => "敵水上打撃艦隊",
          :point => :L,
          :index => [8],
        },
        {
          :name => "敵空母機動部隊",
          :point => :N,
          :index => [10],
        },
        {
          :name => "敵精鋭水雷戦隊",
          :point => :I,
          :index => [12],
        },
        {
          :name => "敵空母機動部隊",
          :point => :H,
          :index => [13],
        },
        {
          :name => "敵精鋭水雷戦隊",
          :point => :O,
          :index => [14],
        },
        {
          :name => "敵空母機動部隊",
          :point => :P,
          :index => [15],
        },
        {
          :name => "敵侵攻中核艦隊",
          :point => :J,
          :index => [16, 17, 18],
          :boss => true,
        },
        {
          :name => "敵空母機動部隊",
          :point => :G,
          :index => [19],
        },
      ],
      :map => "Map2-4.png"
    },
    25 => {
      :name => "沖ノ島沖",
      :cells => [
        {
          :name => "敵水雷戦隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "敵前衛艦隊",
          :point => :B,
          :index => [2],
        },
        {
          :name => "敵巡洋艦隊",
          :point => :D,
          :index => [5],
        },
        {
          :name => "敵水上打撃部隊",
          :point => :E,
          :index => [6],
        },
        {
          :name => "敵機動艦隊",
          :point => :I,
          :index => [9],
        },
        {
          :name => "敵侵攻部隊",
          :point => :J,
          :index => [10],
        },
        {
          :name => "敵主力艦隊",
          :point => :L,
          :index => [12, 15],
          :boss => true,
        },
      ],
      :map => "Map2-5.png"
    },
    31 => {
      :name => "モーレイ海",
      :cells => [
        {
          :name => "敵哨戒艦隊",
          :point => :D,
          :index => [1],
        },
        {
          :name => "敵哨戒艦隊",
          :point => :A,
          :index => [2],
        },
        {
          :name => "敵護衛空母群",
          :point => :F,
          :index => [3],
        },
        {
          :name => "敵護衛空母群",
          :point => :C,
          :index => [5],
        },
        {
          :name => "敵北方侵攻艦隊",
          :point => :E,
          :index => [6],
          :boss => true,
        },
      ],
      :map => "Map3-1.png"
    },
    32 => {
      :name => "キス島沖",
      :cells => [
        {
          :name => "敵水雷戦隊",
          :point => :E,
          :index => [1],
        },
        {
          :name => "敵水雷戦隊",
          :point => :A,
          :index => [2],
        },
        {
          :name => "敵水上打撃艦隊",
          :point => :F,
          :index => [4, 10],
        },
        {
          :name => "敵空母機動部隊",
          :point => :C,
          :index => [6],
        },
        {
          :name => "敵キス島包囲艦隊",
          :point => :H,
          :index => [8],
          :boss => true,
        },
      ],
      :map => "Map3-2.png"
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
          :name => "敵護衛空母群",
          :point => :E,
          :index => [3],
        },
        {
          :name => "敵護衛空母群",
          :point => :C,
          :index => [5],
        },
        {
          :name => "敵空母機動部隊",
          :point => :I,
          :index => [7, 12],
        },
        {
          :name => "敵空母機動部隊",
          :point => :D,
          :index => [8],
        },
        {
          :name => "深海棲艦泊地艦隊",
          :point => :G,
          :index => [11, 13],
          :boss => true,
        },
      ],
      :map => "Map3-3.png"
    },
    34 => {
      :name => "北方海域全域",
      :cells => [
        {
          :name => "敵哨戒艦隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "敵哨戒艦隊",
          :point => :J,
          :index => [2],
        },
        {
          :name => "敵前衛艦隊",
          :point => :B,
          :index => [4],
        },
        {
          :name => "敵前衛艦隊",
          :point => :F,
          :index => [5, 16],
        },
        {
          :name => "敵前衛艦隊",
          :point => :L,
          :index => [6, 17],
        },
        {
          :name => "深海棲艦水上打撃艦隊",
          :point => :H,
          :index => [10, 18, 19],
        },
        {
          :name => "深海棲艦泊地防衛艦隊",
          :point => :N,
          :index => [11],
        },
        {
          :name => "深海棲艦泊地防衛艦隊",
          :point => :D,
          :index => [12],
        },
        {
          :name => "深海棲艦泊地防衛艦隊",
          :point => :I,
          :index => [13],
        },
        {
          :name => "深海棲艦北方艦隊中枢",
          :point => :E,
          :index => [15, 20],
          :boss => true,
        },
      ],
      :map => "Map3-4.png"
    },
    35 => {
      :name => "北方AL海域",
      :cells => [
        {
          :name => "北方前衛警戒部隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "北方派遣任務部隊",
          :point => :C,
          :index => [4],
        },
        {
          :name => "北方遊撃部隊",
          :point => :E,
          :index => [5, 12],
        },
        {
          :name => "北方増援部隊前衛A",
          :point => :B,
          :index => [6, 13],
        },
        {
          :name => "北方増援部隊前衛B",
          :point => :G,
          :index => [7],
        },
        {
          :name => "北方AL泊地",
          :point => :F,
          :index => [8, 14],
        },
        {
          :name => "北方増援部隊主力",
          :point => :K,
          :index => [11, 15],
          :boss => true,
        },
      ],
      :map => "Map3-5.png"
    },
    41 => {
      :name => "ジャム島攻略作戦",
      :cells => [
        {
          :name => "敵水雷戦隊",
          :point => :E,
          :index => [1],
        },
        {
          :name => "敵哨戒艦隊",
          :point => :A,
          :index => [2],
        },
        {
          :name => "東方潜水艦隊",
          :point => :H,
          :index => [3],
        },
        {
          :name => "東方艦隊",
          :point => :I,
          :index => [5, 10, 11],
        },
        {
          :name => "東方潜水艦隊",
          :point => :B,
          :index => [6],
        },
        {
          :name => "東方潜水艦隊",
          :point => :G,
          :index => [7],
        },
        {
          :name => "東方艦隊",
          :point => :C,
          :index => [8],
        },
        {
          :name => "東方派遣艦隊",
          :point => :D,
          :index => [9, 12],
          :boss => true,
        },
      ],
      :map => "Map4-1.png"
    },
    42 => {
      :name => "カレー洋制圧戦",
      :cells => [
        {
          :name => "敵潜水教導艦隊",
          :point => :F,
          :index => [1],
        },
        {
          :name => "敵前衛艦隊",
          :point => :A,
          :index => [2],
        },
        {
          :name => "敵潜水教導艦隊",
          :point => :C,
          :index => [6],
        },
        {
          :name => "敵空母機動部隊",
          :point => :H,
          :index => [7, 11, 12],
        },
        {
          :name => "敵補給船団",
          :point => :I,
          :index => [8],
        },
        {
          :name => "東方主力艦隊",
          :point => :D,
          :index => [9, 13],
          :boss => true,
        },
      ],
      :map => "Map4-2.png"
    },
    43 => {
      :name => "リランカ島空襲",
      :cells => [
        {
          :name => "敵前衛艦隊",
          :point => :J,
          :index => [1],
        },
        {
          :name => "敵前衛艦隊",
          :point => :A,
          :index => [2],
        },
        {
          :name => "敵潜水艦隊",
          :point => :F,
          :index => [4, 14, 15],
        },
        {
          :name => "敵潜水艦隊",
          :point => :K,
          :index => [5, 16],
        },
        {
          :name => "敵潜水艦隊",
          :point => :D,
          :index => [7, 17, 18],
        },
        {
          :name => "敵空母機動部隊",
          :point => :G,
          :index => [8, 19, 20],
        },
        {
          :name => "敵支援艦隊",
          :point => :H,
          :index => [9],
        },
        {
          :name => "敵補給船団",
          :point => :M,
          :index => [12],
        },
        {
          :name => "東方主力艦隊",
          :point => :I,
          :index => [13],
          :boss => true,
        },
      ],
      :map => "Map4-3.png"
    },
    44 => {
      :name => "カスガダマ沖海戦",
      :cells => [
        {
          :name => "敵前衛艦隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "敵潜水艦哨戒線",
          :point => :I,
          :index => [3],
        },
        {
          :name => "敵潜水艦哨戒線",
          :point => :F,
          :index => [4],
        },
        {
          :name => "敵東方艦隊残存部隊",
          :point => :C,
          :index => [5, 11],
        },
        {
          :name => "敵空母機動部隊",
          :point => :G,
          :index => [7, 12, 13],
        },
        {
          :name => "敵東方艦隊残存部隊",
          :point => :J,
          :index => [8, 14],
        },
        {
          :name => "敵東方中枢艦隊",
          :point => :H,
          :index => [10],
          :boss => true,
        },
      ],
      :map => "Map4-4.png"
    },
    45 => {
      :name => "カレー洋リランカ島沖",
      :cells => [
        {
          :name => "東洋方面威力偵察部隊",
          :point => :D,
          :index => [3],
        },
        {
          :name => "東洋方面反攻先遣隊",
          :point => :C,
          :index => [4, 14],
        },
        {
          :name => "東洋艦隊新編水上打撃部隊",
          :point => :E,
          :index => [5],
        },
        {
          :name => "深海東洋方面潜水艦隊",
          :point => :F,
          :index => [6, 15, 16],
        },
        {
          :name => "深海東洋艦隊機動部隊",
          :point => :H,
          :index => [8, 17],
        },
        {
          :name => "東洋方面後方兵站部隊",
          :point => :I,
          :index => [9],
        },
        {
          :name => "深海東洋方面増援艦隊",
          :point => :J,
          :index => [10, 18],
        },
        {
          :name => "リランカ島港湾守備隊",
          :point => :M,
          :index => [13, 19],
          :boss => true,
        },
      ],
      :map => "Map4-5.png"
    },
    51 => {
      :name => "南方海域前面",
      :cells => [
        {
          :name => "敵前衛哨戒艦隊",
          :point => :A,
          :index => [2],
        },
        {
          :name => "敵潜水艦哨戒線",
          :point => :D,
          :index => [3],
        },
        {
          :name => "敵水上打撃部隊",
          :point => :F,
          :index => [5, 10],
        },
        {
          :name => "敵空母機動部隊",
          :point => :E,
          :index => [6, 11],
        },
        {
          :name => "敵護衛空母群",
          :point => :H,
          :index => [7, 12],
        },
        {
          :name => "敵前線司令艦隊",
          :point => :I,
          :index => [9],
          :boss => true,
        },
      ],
      :map => "Map5-1.png"
    },
    52 => {
      :name => "珊瑚諸島沖",
      :cells => [
        {
          :name => "敵前衛艦隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "敵潜水艦隊",
          :point => :B,
          :index => [2],
        },
        {
          :name => "敵潜水艦隊",
          :point => :F,
          :index => [3],
        },
        {
          :name => "敵水上打撃部隊",
          :point => :G,
          :index => [4, 11],
        },
        {
          :name => "敵任務部隊",
          :point => :C,
          :index => [6],
        },
        {
          :name => "敵補給部隊",
          :point => :I,
          :index => [7],
        },
        {
          :name => "敵任務部隊",
          :point => :J,
          :index => [9, 13],
        },
        {
          :name => "敵機動部隊本隊",
          :point => :D,
          :index => [10, 14],
          :boss => true,
        },
      ],
      :map => "Map5-2.png"
    },
    53 => {
      :name => "サブ島沖海域",
      :cells => [
        {
          :name => "敵潜水警戒艦隊",
          :point => :B,
          :index => [2],
        },
        {
          :name => "敵前衛警戒艦隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "敵泊地護衛主力艦隊",
          :point => :D,
          :index => [4, 12],
        },
        {
          :name => "敵任務部隊",
          :point => :E,
          :index => [5],
        },
        {
          :name => "敵泊投錨中輸送船団",
          :point => :F,
          :index => [6],
        },
        {
          :name => "敵支援艦隊",
          :point => :J,
          :index => [10],
        },
        {
          :name => "敵サーモン方面主力艦隊",
          :point => :K,
          :index => [11],
          :boss => true,
        },
      ],
      :map => "Map5-3.png"
    },
    54 => {
      :name => "サーモン海域",
      :cells => [
        {
          :name => "敵ピケット艦隊",
          :point => :A,
          :index => [1],
        },
        {
          :name => "敵任務部隊",
          :point => :C,
          :index => [3],
        },
        {
          :name => "敵前衛艦隊",
          :point => :F,
          :index => [4],
        },
        {
          :name => "敵任務部隊",
          :point => :G,
          :index => [5],
        },
        {
          :name => "敵潜水艦隊",
          :point => :I,
          :index => [6],
        },
        {
          :name => "敵水上打撃部隊",
          :point => :N,
          :index => [10],
        },
        {
          :name => "敵機動部隊主力",
          :point => :H,
          :index => [12, 17],
        },
        {
          :name => "敵機動部隊支隊",
          :point => :K,
          :index => [13],
        },
        {
          :name => "敵補給部隊本体",
          :point => :O,
          :index => [15, 19, 20],
          :boss => true,
        },
        {
          :name => "敵潜水部隊",
          :point => :I,
          :index => [16],
        },
      ],
      :map => "Map5-4.png"
    },
    55 => {
      :name => "サーモン海域北方",
      :cells => [
        {
          :name => "敵前衛警戒部隊",
          :point => :B,
          :index => [1],
        },
        {
          :name => "敵前衛警戒部隊",
          :point => :A,
          :index => [2],
        },
        {
          :name => "敵対潜警戒部隊",
          :point => :F,
          :index => [3],
        },
        {
          :name => "敵潜水艦隊",
          :point => :C,
          :index => [4],
        },
        {
          :name => "敵任務部隊前衛",
          :point => :D,
          :index => [5],
        },
        {
          :name => "敵新鋭戦艦部隊",
          :point => :K,
          :index => [6],
        },
        {
          :name => "敵対潜警戒部隊",
          :point => :M,
          :index => [7],
        },
        {
          :name => "敵水上打撃部隊",
          :point => :G,
          :index => [10, 15],
        },
        {
          :name => "敵水上打撃部隊",
          :point => :H,
          :index => [11, 16],
        },
        {
          :name => "敵水上打撃部隊",
          :point => :E,
          :index => [12, 17],
        },
        {
          :name => "敵任務部隊本隊",
          :point => :N,
          :index => [14, 18],
          :boss => true,
        },
      ],
      :map => "Map5-5.png"
    },
    61 => {
      :name => "中部海域哨戒線",
      :cells => [
        {
          :name => "中部海域 敵遊撃部隊",
          :point => :B,
          :index => [3],
        },
        {
          :name => "中部海域哨戒戦 A地点",
          :point => :C,
          :index => [4],
        },
        {
          :name => "中部海域哨戒戦 B地点",
          :point => :D,
          :index => [5, 12, 13],
        },
        {
          :name => "敵機動部隊",
          :point => :H,
          :index => [7],
        },
        {
          :name => "中部海域哨戒戦 D地点",
          :point => :F,
          :index => [8],
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
      :map => "Map6-1.png"
    },
    62 => {
      :name => "MS諸島沖",
      :cells => [
        {
          :name => "敵攻略支援部隊A群",
          :point => :A,
          :index => [1],
        },
        {
          :name => "敵攻略支援部隊B群",
          :point => :B,
          :index => [2, 12],
        },
        {
          :name => "敵空母機動部隊",
          :point => :E,
          :index => [5, 14],
        },
        {
          :name => "敵高速水上打撃部隊",
          :point => :G,
          :index => [7],
        },
        {
          :name => "敵任務部隊B群",
          :point => :H,
          :index => [9, 16],
        },
        {
          :name => "敵任務部隊A群",
          :point => :I,
          :index => [10],
        },
        {
          :name => "敵攻略部隊本体",
          :point => :K,
          :index => [11, 17, 18],
          :boss => true,
        },
      ],
      :map => "Map6-2.png"
    },
    63 => {
      :name => "グアノ環礁沖海域",
      :cells => [
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
          :name => "留守泊地旗艦艦隊",
          :point => :J,
          :index => [10],
          :boss => true,
        },
      ],
      :map => "Map6-3.png"
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
  }

  def self.map
    @@map
  end
end

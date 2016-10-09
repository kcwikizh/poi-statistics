class KanColleConstant
  @@area = {
    1 => {
      :name => "鎮守府海域",
      :maps => [11, 12, 13, 14, 15, 16],
    },
    2 => {
      :name => "南西諸島海域",
      :maps => [21, 22, 23, 24, 25],
    },
    3 => {
      :name => "北方海域",
      :maps => [31, 32, 33, 34, 35],
    },
    4 => {
      :name => "西方海域",
      :maps => [41, 42, 43, 44, 45],
    },
    5 => {
      :name => "南方海域",
      :maps => [51, 52, 53, 54, 55],
    },
    6 => {
      :name => "中部海域",
      :maps => [61, 62, 63, 64, 65],
    },
    31 => {
      :name => "反撃！第二次SN作戦",
      :maps => [311, 312, 313, 314, 315, 316, 317],
      :event => true,
      :available => false,
    },
    32 => {
      :name => "突入！海上輸送作戦",
      :maps => [321, 322, 323, 324, 325],
      :event => true,
      :available => false,
    },
    33 => {
      :name => "出撃！礼号作戦",
      :maps => [331, 332, 333],
      :event => true,
      :available => false,
    },
    34 => {
      :name => "開設！基地航空隊",
      :maps => [341, 342, 343, 344, 345, 346, 347],
      :event => true,
      :available => false,
    },
    35 => {
      :name => "迎撃！第二次マレー沖海戦",
      :maps => [351, 352, 353, 354],
      :event => true,
      :available => false,
    },
  }

  def self.area
    @@area
  end
end

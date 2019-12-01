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
    7 => {
      :name => "南西海域",
      :maps => [71, 72],
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
    #31 => {
    #  :name => "反撃！第二次SN作戦",
    #  :maps => [311, 312, 313, 314, 315, 316, 317],
    #  :event => true,
    #  :available => false,
    #},
    #32 => {
    #  :name => "突入！海上輸送作戦",
    #  :maps => [321, 322, 323, 324, 325],
    #  :event => true,
    #  :available => false,
    #},
    #33 => {
    #  :name => "出撃！礼号作戦",
    #  :maps => [331, 332, 333],
    #  :event => true,
    #  :available => false,
    #},
    #34 => {
    #  :name => "開設！基地航空隊",
    #  :maps => [341, 342, 343, 344, 345, 346, 347],
    #  :event => true,
    #  :available => false,
    #},
    #35 => {
    #  :name => "迎撃！第二次マレー沖海戦",
    #  :maps => [351, 352, 353, 354],
    #  :event => true,
    #  :available => false,
    #},
    36 => {
      :name => "発令！「艦隊作戦第三法」",
      :maps => [361, 362, 363, 364, 365],
      :event => true,
    },
    37 => {
      :name => "偵察戦力緊急展開！「光」作戦",
      :maps => [371, 372, 373],
      :event => true,
    },
    38 => {
      :name => "出撃！北東方面 第五艦隊",
      :maps => [381, 382, 383, 384, 385],
      :event => true,
    },
    39 => {
      :name => "西方再打通！欧州救援作戦",
      :maps => [391, 392, 393, 394, 395, 396, 397],
      :event => true,
    },
    40 => {
      :name => "捷号決戦！邀撃、レイテ沖海戦(前篇)",
      :maps => [401, 402, 403, 404],
      :event => true,
    },
    41 => {
      :name => "捷号決戦！邀撃、レイテ沖海戦(後篇)",
      :maps => [411, 412, 413, 414, 415, 416, 417],
      :event => true,
    },
    42 => {
      :name => "抜錨！連合艦隊、西へ！",
      :maps => [421, 422, 423, 424, 425],
      :event => true,
    },
    43 => {
      :name => "邀撃！ブイン防衛作戦",
      :maps => [431, 432, 433],
      :event => true,
    },
    44 => {
      :name => "発動！友軍救援「第二次ハワイ作戦」",
      :maps => [441, 442, 443, 444, 445],
      :event => true,
    },
    45 => {
      :name => "欧州方面反撃作戦 発動！「シングル作戦」",
      :maps => [451, 452, 453],
      :event => true,
    },
    46 => {
      :name => "進撃！第二次作戦「南方作戦」",
      :maps => [461, 462, 463, 464],
      :event => true,
    }
  }

  def self.area
    @@area
  end
end

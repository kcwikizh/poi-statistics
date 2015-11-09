class KanColleConstant
  @@ship_type = {
    1 => {
      :name => "海防艦",
      :symbol => "DE",
    },
    2 => {
      :name => "駆逐艦",
      :symbol => "DD",
    },
    3 => {
      :name => "軽巡洋艦",
      :symbol => "CL",
    },
    4 => {
      :name => "重雷装巡洋艦",
      :symbol => "CLT",
    },
    5 => {
      :name => "重巡洋艦",
      :symbol => "CA",
    },
    6 => {
      :name => "航空巡洋艦",
      :symbol => "CAV",
    },
    7 => {
      :name => "軽空母",
      :symbol => "CVL",
    },
    8 => {
      :name => "巡洋戦艦",
      :symbol => "BB",
    },
    9 => {
      :name => "戦艦",
      :symbol => "BB",
    },
    10 => {
      :name => "航空戦艦",
      :symbol => "BBV",
    },
    11 => {
      :name => "正規空母",
      :symbol => "CV",
    },
    12 => {
      :name => "超弩級戦艦",
      :symbol => "BB",
    },
    13 => {
      :name => "潜水艦",
      :symbol => "SS",
    },
    14 => {
      :name => "潜水空母",
      :symbol => "SSV",
    },
    15 => {
      :name => "補給艦",
      :symbol => "AE",
    },
    16 => {
      :name => "水上機母艦",
      :symbol => "AV",
    },
    17 => {
      :name => "揚陸艦",
      :symbol => "LHA",
    },
    18 => {
      :name => "装甲空母",
      :symbol => "CVB",
    },
    19 => {
      :name => "工作艦",
      :symbol => "AR",
    },
    20 => {
      :name => "潜水母艦",
      :symbol => "AS",
    },
    21 => {
      :name => "練習巡洋艦",
      :symbol => "CLp",
    },
    22 => {
      :name => "補給艦",
      :symbol => "AO",
    },
  }

  def ship_type
    @@ship_type
  end
end

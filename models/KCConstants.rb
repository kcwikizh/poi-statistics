class KCConstants
  @@formations = {
    1 => '単縦陣',
    2 => '複縦陣',
    3 => '輪形陣',
    4 => '梯形陣',
    5 => '単横陣',
    11 => '第一警戒航行序列',
    12 => '第二警戒航行序列',
    13 => '第三警戒航行序列',
    14 => '第四警戒航行序列'
  }

  @@ship_types = {
    '驱逐舰' => ['dd'],
    '轻巡洋舰' => ['cl'],
    '重巡洋舰' => ['ca'],
    '轻空母' => ['cvl'],
    '空母' => ['cv', 'cvb'],
    '战舰' => ['bb'],
    '潜水舰' => ['ss', 'ssv'],
    '水母' => ['av'],
    '其他' => ['ar', 'as', 'ao', 'lha', 'clp'],
  }

  class << self
    def formations
      @@formations
    end

    def ship_types
      @@ship_types
    end

    def formation
      return {
        1 => '单纵',
        2 => '复纵',
        3 => '轮型',
        4 => '梯形',
        5 => '单横',
      }
    end
  end
end

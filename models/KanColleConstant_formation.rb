class KanColleConstant
  @@formation = {
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

  def formation
    @@formation
  end
end

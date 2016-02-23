class UAWhiteList
  @@list = [
    '(?:^Reporter v(?:\\d+\\.)+\\d+)',
    '(?:^ElectronicObserver-MaKai Plugin v(?:\\d+\\.)+\\d+)',
    '(?:^KC3Kai (?:\\d+\\.)+\\d+)'
  ]

  def self.filters
    @@list
  end
end

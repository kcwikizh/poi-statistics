class UAWhiteList
  @@list = [
    '(?:^Reporter v\\d)',
    '(?:^ElectronicObserver-MaKai Plugin v\\d)',
    '(?:^KC3Kai \\d)',
    '(?:^AdmiralRoom Reporter v2\\.)',
  ]

  def self.filters
    @@list
  end
end

class KanColleConstant
  @@event = [
    {
      name: "SummerEvent2015",
      from_time: Time.new(2015, 8, 10, 12),
      to_time: Time.new(2015, 9, 7, 12),
      map: [311, 312, 313, 314, 315, 316, 317]
    },
    {
      name: "Sanma2015",
      from_time: Time.new(2015, 10, 9, 12),
      to_time: Time.new(2015, 10, 30, 12),
      map: [15, 16, 25, 53, 63]
    },
    {
      name: "Halloween2015",
      from_time: Time.new(2015, 10, 30, 12),
      to_time: Time.new(2015, 11, 18, 12),
      map: [45]
    },
    {
      name: "AutumnEvent2015",
      from_time: Time.new(2015, 11, 18, 12),
      to_time: Time.new(2015, 12, 8, 12),
      map: [321, 322, 323, 324, 325]
    },
    {
      name: "Christmas2015",
      from_time: Time.new(2015, 12, 8, 12),
      to_time: Time.new(2015, 12, 29, 12),
      map: [15, 16, 25, 35, 45]
    },
    {
      name: "WinterEvent2016",
      from_time: Time.new(2016, 2, 10, 12),
      to_time: Time.new(2016, 2, 29, 12),
      map: [331, 332, 333]
    },
    {
      name: "April2016",
      from_time: Time.new(2016, 4, 1, 12),
      to_time: Time.new(2016, 5, 2, 12),
      map: [15, 22, 25, 33, 34, 35, 44, 51, 53, 54, 62]
    },
    {
      name: "SpringEvent2016",
      from_time: Time.new(2016, 5, 2, 12),
      to_time: Time.now + 794,
      map: [341, 342, 343, 344, 345, 346, 347]
    }
  ]

  def self.event
    @@event
  end
end

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
      to_time: Time.now + 86400,
      map: [15, 16, 25, 35, 45]
    }
  ]

  def self.event
    @@event
  end
end

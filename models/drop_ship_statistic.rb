class DropShipStatistic
  include Mongoid::Document
  store_in collection: "drop_ship_stats", client: "poistat"

  field :name,            :type => String
  field :ship_id,         :type => Integer
  field :map_id,          :type => Integer
  field :cell_id,         :type => Integer
  field :point_id,        :type => Symbol
  field :level_no,        :type => Integer
  field :rank,            :type => Symbol
  field :hour_no,         :type => Integer
  field :minute_no,       :type => Integer
  field :from_time,       :type => Time
  field :to_time,         :type => Time
  field :count,           :type => Integer, :default => 0
  field :hq_count,        :type => Hash, :default => {}
  field :origin_count,    :type => Hash, :default => {}
  field :enemy_fleet,     :type => Array
  field :enemy_formation, :type => Integer

  index({ map_id: 1, point_id: 1, level_no: 1 })
  index :ship_id => 1
end

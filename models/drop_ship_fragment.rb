class DropShipFragment
  include Mongoid::Document
  store_in collection: "drop_ship_fragments", client: "poistat"

  field :rule_name,     :type => String
  field :start_time,    :type => Time
  field :end_time,      :type => Time
  field :ship_id,       :type => Integer
  field :map_id,        :type => Integer
  field :point_id,      :type => Symbol
  field :level_no,      :type => Integer
  field :clock_no,      :type => Integer
  field :count,         :type => Integer, :default => 0
  field :s_count,       :type => Integer, :default => 0
  field :a_count,       :type => Integer, :default => 0
  field :b_count,       :type => Integer, :default => 0
  field :c_count,       :type => Integer, :default => 0
  field :d_count,       :type => Integer, :default => 0
  field :e_count,       :type => Integer, :default => 0
  field :min_hq_lv,     :type => Integer, :default => 999
  field :max_hq_lv,     :type => Integer, :default => 0
  field :enemy_fleets,  :type => Array

  index({ rule_name: 1, map_id: 1, point_id: 1, level_no: 1 })
  index({ rule_name: 1, ship_id: 1 })
end

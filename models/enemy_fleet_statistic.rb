class EnemyFleetStatistic
  include Mongoid::Document
  store_in collection: "enemy_fleet_stats", client: "poistat"

  field :ship_id_list,  :type => Array
  field :formation,     :type => Integer
  field :map_id,        :type => Integer
  field :point_id,      :type => Symbol
  field :level_no,      :type => Integer
  field :min_hq_lv,     :type => Integer, :default => 999
  field :max_hq_lv,     :type => Integer, :default => 0
  field :count,         :type => Integer, :default => 0

  index({ map_id: 1, point_id: 1, level_no: 1 })
end

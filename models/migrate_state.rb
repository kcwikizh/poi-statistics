class MigrateState
  include Mongoid::Document
  store_in collection: "migrate_states", client: "poistat"

  field :data_type,     :type => Symbol
  field :migrate_time,  :type => Time

  validates_uniqueness_of :data_type

  index :data_type => 1
end

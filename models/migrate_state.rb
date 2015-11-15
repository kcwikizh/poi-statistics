class MigrateState
  include Mongoid::Document
  store_in collection: "migrate_states", client: "poistat"

  field :data_type,     :type => Symbol
  field :migrate_time,  :type => Time

  index :data_type => 1
end

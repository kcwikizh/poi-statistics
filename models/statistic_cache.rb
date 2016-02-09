class StatisticCache
  include Mongoid::Document
  store_in collection: "stats_cache", client: "poistat"

  field :name,        :type => String
  field :content,     :type => String
  field :cache_time,  :type => Time, :default => Time.now

  index :name => 1
end

require_relative '../app'

db = Mongoid::Clients.default

db["dropshiprecords"].delete_many({
  "_id" => {
    "$lt" => BSON::ObjectId.from_time(Time.parse(Sinatra::KVDataHelper.get_kv_data("migrate_drop")))
  }
})
db["dropshiprecords"].indexes.create_one(
  :mapId  => 1,
  :cellId => 1,
  :shipId => 1,
  :mapLv  => 1,
  :rank   => 1
)

db["createitemrecords"].delete_many({
  "_id" => {
    "$lt" => BSON::ObjectId.from_time(Time.parse(Sinatra::KVDataHelper.get_kv_data("migrate_development")))
  }
})
db["createitemrecords"].indexes.create_one(
  :itemId  => 1
)

db["createshiprecords"].delete_many({
  "_id" => {
    "$lt" => BSON::ObjectId.from_time(Time.parse(Sinatra::KVDataHelper.get_kv_data("migrate_construction")))
  }
})
db["createshiprecords"].indexes.create_one(
  :shipId  => 1
)

class DropShipRecord
  include Mongoid::Document
  store_in collection: "dropshiprecords"

  field :shipId, type: Integer
  field :quest,  type: String
  field :enemy,  type: String
  field :rank,   type: String
end
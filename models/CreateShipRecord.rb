class CreateShipRecord
  include Mongoid::Document
  store_in collection: "createshiprecords"

  field :kdockId,   type: Integer
  field :highspeed, type: Integer
  field :secretary, type: Integer
  field :shipId,    type: Integer
  field :items,     type: Array
end
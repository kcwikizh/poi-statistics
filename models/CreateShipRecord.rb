class CreateShipRecord
  include Mongoid::Document
  store_in collection: "createshiprecords"

  field :kdockId,   type: Integer
  field :largeFlag, type: Boolean
  field :highspeed, type: Integer
  field :secretary, type: Integer
  field :teitokuLv, type: Integer
  field :shipId,    type: Integer
  field :items,     type: Array
  field :origin,    type: String
end

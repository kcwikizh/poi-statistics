class CreateShipRecord
  include Mongoid::Document
  store_in collection: "createitemrecords"

  field :teitokuLv,  type: Integer
  field :itemId,     type: Integer
  field :secretary,  type: Integer
  field :successful, type: Boolean
  field :items,      type: Array
  field :origin,     type: String
end

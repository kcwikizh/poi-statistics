class DropShipRecord
  include Mongoid::Document
  store_in collection: "dropshiprecords"

  field :shipId,         type: Integer
  field :quest,          type: String
  field :enemy,          type: String
  field :rank,           type: String
  field :isBoss,         type: Boolean
  field :mapId,          type: Integer
  field :cellId,         type: Integer
  field :teitokuLv,      type: Integer
  field :mapLv,          type: Integer
  field :enemyFormation, type: Integer
  field :enemyShips1,     type: Array
  field :enemyShips2,     type: Array
  field :origin,         type: String
end

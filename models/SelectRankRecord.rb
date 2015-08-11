class SelectRankRecord
  include Mongoid::Document
  store_in collection: "selectrankrecords"

  field :teitokuId, type: Integer
  field :teitokuLv, type: Integer
  field :mapareaId, type: Integer
  field :rank,      type: Integer
  field :origin,    type: String
end

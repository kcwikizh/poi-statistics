require_relative '../app'

db = Mongoid::Clients.default
db["dropshiprecords"].drop
db["createitemrecords"].drop
db["createshiprecords"].drop

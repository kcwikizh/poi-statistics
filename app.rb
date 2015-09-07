require 'sinatra'
require 'mongoid'

configure do
  set :server, :puma

  Mongoid.load!('./config/mongoid.yml')
end

error 404 do
  '404 - Not Found'
end

Dir['./helpers/*.rb'].each { |file| load file }
Dir['./models/*.rb'].each { |file| load file }
Dir['./routes/*.rb'].each { |file| load file }

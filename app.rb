require 'psych'
require 'sinatra'
require 'sinatra/activerecord'
require 'mongoid'
require_relative './config/environments'

configure do
  Mongoid.load!("#{File.dirname(__FILE__)}/config/mongoid.yml")
end

error 404 do
  '404 - Not Found'
end

Dir["#{File.dirname(__FILE__)}/data/*.rb"].each { |file| load file }
Dir["#{File.dirname(__FILE__)}/models/*.rb"].each { |file| load file }
Dir["#{File.dirname(__FILE__)}/helpers/*.rb"].each { |file| load file }
Dir["#{File.dirname(__FILE__)}/routes/*.rb"].each { |file| load file }

require 'mongoid'
require 'pathname'
require 'uri'

path = Pathname.new(File.dirname(__FILE__)).realpath.parent

Mongoid.load!("#{path}/config/mongoid.yml", :production)
Dir["#{path}/models/*.rb"].each { |file| load file }

list = ['/', '/construction/']

CreateShipRecord.distinct(:shipId).each do |id|
  list.push "/construction/ship/#{URI.escape(KCConstants.ships[id])}.json"
  list.push "/construction/ship/#{URI.escape(KCConstants.ships[id])}.html"
end

puts `staticify --save -d #{path}/public -p "#{list.join(',')}" #{path}`
list.clear

map = %Q{
  function() {
    emit(this.items, this.items.join('/'));
  }
}
reduce = %Q{
  function(key, values) {
    return key.join('/');
  }
}
CreateShipRecord.map_reduce(map, reduce).out(inline: 1).each do |item|
  list.push "/construction/recipe/#{item["value"]}.json"
  list.push "/construction/recipe/#{item["value"]}.html"
end

puts `staticify --save -d #{path}/public -p "#{list.join(',')}" #{path}`
list = ['/drop/']

DropShipRecord.distinct(:quest).each do |name|
  list.push "/drop/map/#{URI.escape(name)}.json"
  list.push "/drop/map/#{URI.escape(name)}.html"
end

puts `staticify --save -d #{path}/public -p "#{list.join(',')}" #{path}`
list.clear

DropShipRecord.distinct(:shipId).each do |id|
  list.push "/drop/ship/#{URI.escape(KCConstants.ships[id])}.json"
  list.push "/drop/ship/#{URI.escape(KCConstants.ships[id])}.html"
end

puts `staticify --save -d #{path}/public -p "#{list.join(',')}" #{path}`

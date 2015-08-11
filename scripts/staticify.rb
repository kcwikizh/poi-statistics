require 'mongoid'
require 'pathname'
require 'uri'

path = Pathname.new(File.dirname(__FILE__)).realpath.parent

File.delete("#{path}/public/index.html") if File.exist?("#{path}/public/index.html")
`rm -rf "#{path}/public/construction"` if Dir.exists?("#{path}/public/construction")
`rm -rf "#{path}/public/drop"` if Dir.exists?("#{path}/public/drop")
`rm -rf "#{path}/public/event"` if Dir.exists?("#{path}/public/event")

Mongoid.load!("#{path}/config/mongoid.yml", :production)
Dir["#{path}/models/*.rb"].each { |file| load file }

list = ['/']
list.push '/drop/'

KCConstants.maps.each do |map_id, name|
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
list.clear

list.push '/event/'

(1..7).each do |i|
  list.push "/drop/event/31#{i}.html"
end

puts `staticify --save -d #{path}/public -p "#{list.join(',')}" #{path}`

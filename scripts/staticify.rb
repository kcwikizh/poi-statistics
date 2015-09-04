require 'mongoid'
require 'pathname'
require 'uri'

path = Pathname.new(File.dirname(__FILE__)).realpath.parent

File.delete("#{path}/public/index.html") if File.exist?("#{path}/public/index.html")
`rm -rf #{path}/public/about` if Dir.exists?("#{path}/public/about")
`rm -rf #{path}/public/construction` if Dir.exists?("#{path}/public/construction")
`rm -rf #{path}/public/drop` if Dir.exists?("#{path}/public/drop")
`rm -rf #{path}/public/event` if Dir.exists?("#{path}/public/event")
`rm -rf #{path}/public/enemy` if Dir.exists?("#{path}/public/enemy")
`rm -rf #{path}/public/enemy2` if Dir.exists?("#{path}/public/enemy2")
`rm -rf #{path}/public/wiki` if Dir.exists?("#{path}/public/wiki")

Mongoid.load!("#{path}/config/mongoid.yml", :production)
Dir["#{path}/models/*.rb"].each { |file| load file }

list = ['/', '/about/']

list.push '/construction/'
map = %Q{
  function() {
    emit(this.items.join('-'), null);
  }
}
reduce = %Q{
  function(key, values) {
    return null;
  }
}
CreateShipRecord.where(:origin.exists => true).map_reduce(map, reduce).out(inline: 1).each do |q|
  list.push "/construction/recipe/#{q['_id']}.json"
  list.push "/construction/recipe/#{q['_id']}.html"
end
KCConstants.ship.select{|k, v| v[:construction] }.each do |k, v|
  list.push "/construction/ship/#{URI.escape(v[:name])}.json"
  list.push "/construction/ship/#{URI.escape(v[:name])}.html"
end

list.push '/drop/'
KCConstants.maps.each do |map_id, name|
  list.push "/drop/map/#{URI.escape(name)}.json"
  list.push "/drop/map/#{URI.escape(name)}.html"
end

list.push '/event/'
(1..7).each do |i|
  list.push "/event/31#{i}.html"
end

[(11..16).to_a, (21..25).to_a, (31..35).to_a, (41..45).to_a, (51..55).to_a, (61..63).to_a, (311..317).to_a].flatten.each do |i|
  list.push "/enemy/#{i}.html"
  list.push "/enemy2/#{i}.html"
  list.push "/wiki/drop/#{i}.html"
end

File.open("#{path}/tmp/staticify.lst", "w") {|f| f.write(list.join("\n"))}
puts `cat #{path}/tmp/staticify.lst | staticify --save -d #{path}/public #{path}`

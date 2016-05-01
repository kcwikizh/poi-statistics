configure :development, :production do
  set :server, :puma

  db = URI.parse('postgres://postgres:@localhost:5432/poi-stat')
  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :port     => db.port,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf-8'
  )
end

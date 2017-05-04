post '/reg/?' do
  endpoint = params[:endpoint]
  subscriber = Subscriber.where("endpoint = :e", { e: endpoint }).first_or_create(endpoint: endpoint)
  subscriber.p256dh = params[:p256dh]
  subscriber.auth = params[:auth]
  subscriber.timestamp = Time.now.to_i / 86400
  subscriber.save

  content_type :json
  '{"success":true}'
end

post '/unreg/?' do
  endpoint = params[:endpoint]
  auth = params[:auth]
  Subscriber.delete_all(endpoint: endpoint, auth: auth)

  content_type :json
  '{"success":true}'
end

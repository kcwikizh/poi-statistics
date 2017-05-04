require_relative '../app'
require 'webpush'

Subscriber.all.each do |subscriber|
  begin
    Webpush.payload_send(
      message: '{"title":"poi掉落统计","body":"' + ARGV[0] + '"}',
      endpoint: subscriber.endpoint,
      p256dh: subscriber.p256dh,
      auth: subscriber.auth
    )
    p subscriber.endpoint
  rescue
    next
  end
end

require_relative '../lib/coolsms'

require 'json'

file = File.join(File.dirname(__FILE__), '../config.json')
config = JSON.parse(File.read(file))
request = Coolsms::Request.new(config)
message = Coolsms::Message.new(request)
res = message.send_one({
  to: '01011112222',
  from: '01022223333',
  text: '발송 예제 메시지'
})

puts res

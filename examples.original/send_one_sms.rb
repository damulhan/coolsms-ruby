require '../lib/message.rb'

res = Message.send_one({
  to: '01000000001',
  from: '029302266',
  text: '발송 예제 메시지'
})
puts res

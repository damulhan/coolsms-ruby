require '../lib/message.rb'

res = Message.send_one({
  to: '01000000001',
  from: '029302266',
  text: '발송 예제 메시지 : 메시지 내용이 한글 45자, 영어 90자 이상 입력할 경우 자동으로 LMS타입의 문자로 발송됩니다.'
})
puts res

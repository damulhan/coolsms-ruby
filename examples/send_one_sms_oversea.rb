require '../lib/message.rb'

res = Message.send_one({
  country: '국가번호 입력(미국: 1, 중국: 86, 일본:81, ...)',
  to: '수신번호 입력',
  from: '발신번호 입력',
  text: '해외 발송 예제 메시지'
})
puts res

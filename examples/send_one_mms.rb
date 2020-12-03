require '../lib/storage.rb'
require '../lib/message.rb'

res = Storage.upload(File.realpath('./testImage.jpg'))
fileId = res['fileId']

res = Message.send_one({
  to: '01000000001',
  from: '029302266',
  text: '발송 예제 메시지',
  imageId: fileId
})
puts res

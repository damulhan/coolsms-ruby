require '../lib/group.rb'

group_id = Group.create['groupId']
res = Group.add_messages(group_id, [
  {
    to: '01000000001',
    from: '029302266',
    text: '발송 예제 메시지',
  }
])
messageId = res['resultList'][0]['messageId']

# ruby에서 메시지 삭제 지원 안됨
res = Group.delete_messages(group_id, [
  messageId
])
puts res

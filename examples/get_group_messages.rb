require '../lib/group.rb'

group_id = Group.create['groupId']
Group.add_messages(group_id, [
  {
    to: '01000000001',
    from: '029302266',
    text: '발송 예제 메시지',
  }
])
res = Group.get_messages(group_id)
puts res

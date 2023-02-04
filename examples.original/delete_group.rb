require '../lib/group.rb'

group_id = Group.create['groupId']
res = Group.delete(group_id)
puts res

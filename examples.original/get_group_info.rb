require '../lib/group.rb'

group_id = Group.create['groupId']
res = Group.get_info(group_id)
puts res

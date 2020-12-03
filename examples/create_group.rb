require '../lib/group.rb'

group_info = Group.create
puts "Group ID: " + group_info['groupId']

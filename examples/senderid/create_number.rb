require '../../lib/request.rb'

#
# Step 1) 발신번호 등록
#

res = Request.post("/senderid/v1/numbers", { phoneNumber: '01000000001' })
puts res

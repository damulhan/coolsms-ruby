require '../../lib/request.rb'

# 활성화된 발신번호 목록 조회

res = Request.get("/senderid/v1/numbers/active")
puts res

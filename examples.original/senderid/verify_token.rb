require '../../lib/request.rb'


# Step 3) 인증번호 확인
# Step 2 과정에서 획득한 정보를 모두 입력하여 인증받습니다.

# 전화번호 입력
phoneNumber = '01000000001' 

# Transaction ID 입력
transactionId = 'cc4f482bcf167f69f2b15fcfd044f509'

# 음성으로 전달받은 인증번호
token = '9077'

authInfo = {
  authType: 'ARS',
  extras: {
    phoneNumber: phoneNumber
  },
  transactionId: transactionId,
  token: token
}

headers = {
  'x-mfa-data': authInfo.to_json
}

res = Request.put("/senderid/v1/numbers/#{phoneNumber}/authenticate", {}, headers)
puts res

require '../../lib/request.rb'


# Step 2) 인증번호 요청
# 해당 전화번호로 전화를 걸어 인증번호를 알려줍니다.
# 리턴되는 Transaction ID와 인증번호(Token)를 기록해두어 다음 Step에서 사용합니다.

# 인증받을 등록된 전화번호 입력
phoneNumber = '01000000001' 

authInfo = {
  authType: 'ARS',
  extras: {
    phoneNumber: phoneNumber
  }
}

headers = {
  'x-mfa-data': authInfo.to_json
}

res = Request.put("/senderid/v1/numbers/#{phoneNumber}/authenticate", {}, headers)
puts res

puts 'Trasaction ID: ' + res["mfa"]["transactionId"]

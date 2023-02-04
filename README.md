### COOLSMS SDK for Ruby 

config.json 파일을 아래와 같이 설정 후 examples 아래 예제 코드를 실행해 보세요.
```
{
  "api_key": "[INPUT YOUR API KEY]",
  "api_secret": "[INPUT YOUR API SECRET]",
  "protocol": "https",
  "domain": "api.coolsms.co.kr",
  "prefix": ""
}
```

### 설치 

```ruby
gem 'coolsms', github: 'damulhan/coolsms-ruby'
```

### 예제

```ruby
require 'bundler/setup'
require 'coolsms'
require 'json'

file = File.join(File.dirname(__FILE__), 'config.json')
config = JSON.parse(File.read(file))
request = Coolsms::Request.new(config)
message = Coolsms::Message.new(request)
res = message.send_one({
  to: '01011112222',
  from: '01022223333',
  text: '발송 예제 메시지'
})

puts res
```

### 링크

* Coolsms: https://coolsms.co.kr 
* Coolsms Ruby Example: https://github.com/coolsms/coolsms-ruby 

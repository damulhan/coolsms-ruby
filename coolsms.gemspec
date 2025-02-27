Gem::Specification.new do |s|
  s.name = 'coolsms'
  s.version = '0.1.0-damulhan'
  s.authors = ['coolsms']
  s.email = ['']
  s.date = '2019-03-25'
  s.summary = 'coolsms-ruby'
  s.homepage = 'https://coolsms.co.kr/'
  s.files = [
    'README.md',
    'lib/coolsms.rb',
    'lib/coolsms/request.rb',
    'lib/coolsms/message.rb',
    'lib/coolsms/group.rb',
    'lib/coolsms/storage.rb',
    Dir['examples/**/*']
  ].flatten
  s.require_paths = ['lib']
  s.license = ''
end

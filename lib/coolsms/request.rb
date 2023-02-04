require 'openssl'
require 'base64'
require 'net/http'
require 'json'
require 'securerandom'
require 'uri'

module Coolsms
  class Request
    def initialize(options)
      options ||= {}
      options['api_key'] ||= 'api_key'
      options['api_secret'] ||= 'api_secret'
      options['protocol'] ||= 'https'
      options['domain'] ||= 'api.coolsms.co.kr'
      options['prefix'] ||= ''

      @config = options
    end

    def get_uri(path)
      str = @config['protocol'] + '://' + @config['domain'] + @config['prefix']
      URI.parse(str + path)
    end

    def get_header
      api_key = @config['api_key']
      api_secret = @config['api_secret']
      date = Time.now.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
      salt = SecureRandom.hex
      signature = OpenSSL::HMAC.hexdigest('SHA256', api_secret, date + salt)
      'HMAC-SHA256 apiKey=' + api_key + ', date=' + date + ', salt=' + salt + ', signature=' + signature
    end

    def post(path, body)
      header = get_header
      uri = get_uri(path)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      req = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
      req.add_field('Authorization', header)
      req.body = body.to_json if body
      res = http.request(req)
      JSON.parse(res.body)
    end

    def put(path, body, headers = nil)
      auth = get_header
      uri = get_uri(path)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      req = Net::HTTP::Put.new(uri.path, 'Content-Type' => 'application/json')
      req.add_field('Authorization', auth)
      if headers
        headers.each do |k, v|
          req.add_field(k, v)
        end
      end
      req.body = body.to_json if body
      res = http.request(req)
      JSON.parse(res.body)
    end

    def get(path)
      header = get_header
      uri = get_uri(path)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      req = Net::HTTP::Get.new(uri.path, 'Content-Type' => 'application/json')
      req.add_field('Authorization', header)
      res = http.request(req)
      JSON.parse(res.body)
    end

    def delete(path, body)
      header = get_header
      uri = get_uri(path)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      req = Net::HTTP::Delete.new(uri.path, 'Content-Type' => 'application/json')
      req.add_field('Authorization', header)
      res = http.request(req)
      req.body = body.to_json if body
      JSON.parse(res.body)
    end
  end
end

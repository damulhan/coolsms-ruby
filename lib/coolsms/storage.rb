require_relative 'request'

module Coolsms
  class Storage
    def initialize(request)
      @request = request
    end

    def upload(filename)
      imageFile = open(filename).to_a.join
      imageData = Base64.strict_encode64(imageFile)
      @request.post('/storage/v1/files', { file: imageData, type: 'MMS' })
    end
  end
end

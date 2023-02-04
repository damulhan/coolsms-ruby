require_relative 'request'

module Coolsms
  class Message
    def initialize(request)
      @request = request
    end

    def send_one(message)
      @request.post('/messages/v4/send', { message: })
    end

    def send_many(messages)
      @request.post('/messages/v4/send-many', { messages: })
    end
  end
end

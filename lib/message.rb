require_relative 'request'

module Message

  def self.send_one(message)
    return Request.post('/messages/v4/send', { message: message })
  end

end

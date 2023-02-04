require_relative 'request'

module Storage

  def self.upload(filename)
      imageFile = open(filename).to_a.join
      imageData = Base64.strict_encode64(imageFile)
      return Request.post('/storage/v1/files', { file: imageData, type: 'MMS' })
  end

end

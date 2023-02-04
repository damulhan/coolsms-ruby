require_relative 'request'

module Group

  def self.create
    return Request.post('/messages/v4/groups', nil)
  end

  def self.get_info(group_id)
    return Request.get("/messages/v4/groups/#{group_id}")
  end

  def self.delete(group_id)
    return Request.delete("/messages/v4/groups/#{group_id}")
  end

  def self.add_messages(group_id, messages)
      return Request.put("/messages/v4/groups/#{group_id}/messages", { messages: messages })
  end

  def self.delete_messages(group_id, message_ids)
      return Request.delete("/messages/v4/groups/#{group_id}/messages", { messageIds: message_ids })
  end

  def self.get_messages(group_id)
      return Request.get("/messages/v4/groups/#{group_id}/messages")
  end

  def self.get_list
      return Request.get("/messages/v4/groups")
  end

  def self.send(group_id)
      return Request.post("/messages/v4/groups/#{group_id}/send", nil)
  end

end

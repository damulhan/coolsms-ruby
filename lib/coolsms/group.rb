require_relative 'request'

module Coolsms
  class Group
    def initialize(request)
      @request = request
    end

    def create
      @request.post('/messages/v4/groups', nil)
    end

    def get_info(group_id)
      @request.get("/messages/v4/groups/#{group_id}")
    end

    def delete(group_id)
      @request.delete("/messages/v4/groups/#{group_id}")
    end

    def add_messages(group_id, messages)
      @request.put("/messages/v4/groups/#{group_id}/messages", { messages: })
    end

    def delete_messages(group_id, message_ids)
      @request.delete("/messages/v4/groups/#{group_id}/messages", { messageIds: message_ids })
    end

    def get_messages(group_id)
      @request.get("/messages/v4/groups/#{group_id}/messages")
    end

    def get_list
      @request.get('/messages/v4/groups')
    end

    def send(group_id)
      @request.post("/messages/v4/groups/#{group_id}/send", nil)
    end
  end
end

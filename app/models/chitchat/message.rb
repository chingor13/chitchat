module Chitchat
  class Message < ActiveRecord::Base

    belongs_to :user
    belongs_to :chat

    def as_json
      {
        body:  body,
        user_id: user_id
      }.as_json
    end

  end
end

module Chitchat
  class Message < Chitchat::Base

    belongs_to :user
    belongs_to :chat, inverse_of: :messages

    validates :chat, presence: true
    validates :user, presence: true
    validates :body, presence: true

    def as_json(options = nil)
      {
        id:       id,
        chat_id:  chat.id,
        user_id:  user.identifier,
        body:     body,
      }.as_json
    end

  end
end

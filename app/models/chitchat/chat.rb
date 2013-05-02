module Chitchat
  class Chat < ActiveRecord::Base

    belongs_to :to, class_name: "Chitchat::User"
    belongs_to :from, class_name: "Chitchat::User"

    has_many :messages, inverse_of: :chat
    
    validates :from, presence: true
    validates :to, presence: true
    
    def answer!
      update_attributes!(:status => 'open')
    end
    
    def hang_up!
      update_attributes!(:status => 'closed')
    end
    
    def as_json(options = nil)
      {
        id:         id, 
        to:         to.identifier,
        from:       from.identifier,
        status:     status,
        messages:   messages,
      }.as_json
    end

  end
end

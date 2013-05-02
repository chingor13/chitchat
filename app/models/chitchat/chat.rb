module Chitchat
  class Chat < ActiveRecord::Base

    belongs_to :to, :class_name => "Chitchat::User"
    belongs_to :from, :class_name => "Chitchat::User"

    has_many :messages, :inverse_of => :chat
    
    def answer!
      update_attributes!(:status => 'open')
    end
    
    def hang_up!
      update_attributes!(:status => 'closed')
    end

  end
end

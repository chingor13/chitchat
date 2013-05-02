module Chitchat
  class Chat < ActiveRecord::Base

    belongs_to :to, :class_name => "Chitchat::User"
    belongs_to :from, :class_name => "Chitchat::User"

    has_many :messages, :inverse_of => :chat

  end
end

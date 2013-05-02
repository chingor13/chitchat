module Chitchat
  class User < ActiveRecord::Base
    has_many :messages, :inverse_of => :user

    validates :identifier, :presence => true, :uniqueness => true
  end
end

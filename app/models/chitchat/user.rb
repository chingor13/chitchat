module Chitchat
  class User < ActiveRecord::Base
    has_many :messages, :inverse_of => :user

    validates :identifier, :presence => true, :uniqueness => true

    def sign_on!
      # TODO
    end

    def sign_off!
      # TODO
    end
  end
end

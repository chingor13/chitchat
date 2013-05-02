module Chitchat
  class User < ActiveRecord::Base
    has_many :messages, inverse_of: :user

    validates :identifier, presence: true, uniqueness: true

    def sign_on!
      update_attributes!(available: true)
    end

    def sign_off!
      update_attributes!(available: false)
    end
    
    def to_hash
      {identifer: identifier, available: available}
    end
    
  end
end

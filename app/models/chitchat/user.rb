module Chitchat
  class User < Chitchat::Base
    validates :identifier, presence: true, uniqueness: true

    def sign_on!
      update_attributes!(available: true)
    end

    def sign_off!
      update_attributes!(available: false)
    end
    
    def as_json(options = nil)
      {identifer: identifier, available: available}.as_json
    end
    
  end
end

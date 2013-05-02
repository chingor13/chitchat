module Chitchat

  def self.use_relative_model_naming?
    true
  end

  class Base < ActiveRecord::Base
    self.abstract_class = true
  end
end

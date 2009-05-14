module Soundcloud
  module Models
    class Event < Base    
      cattr_accessor :element_name    
      self.element_name = 'event'
    end    
  end
end

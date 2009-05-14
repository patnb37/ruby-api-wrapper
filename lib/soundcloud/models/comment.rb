module Soundcloud
  module Models
    class Comment < Base    
      cattr_accessor :element_name    
      self.site = "#{self.site}/tracks/:track_id/"
      self.element_name = 'comment'      
    end       
  end
end

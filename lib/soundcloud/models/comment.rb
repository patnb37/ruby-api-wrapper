module Soundcloud
  module Models
    
    # Soundcloud Comment resource
    #
    # http://wiki.github.com/soundcloud/api/documentation#comment
    #
    # See Soundcloud::Models::Track
    class Comment < Base    
      cattr_accessor :element_name    
      belongs_to :user, :track
      self.site = "#{self.site}/tracks/:track_id/"
      self.element_name = 'comment'      
    end       
  end
end

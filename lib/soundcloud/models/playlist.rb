module Soundcloud
  module Models
    class Playlist < Base
      cattr_accessor :element_name    
      self.element_name = 'playlist'    
    end        
  end
end

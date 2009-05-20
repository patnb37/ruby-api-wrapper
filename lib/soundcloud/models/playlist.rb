module Soundcloud
  module Models
    class Playlist < Base
      has_many :permissions
      cattr_accessor :element_name    
      self.element_name = 'playlist'    
      def initialize(*args)
        super(*args)
        #create empty tracks array if not existing
        attributes['tracks'] = Array.new if not self.tracks?
      end
    end        
  end
end

module Soundcloud
  module Models
    # Soundcloud Playlist resource
    #
    # http://wiki.github.com/soundcloud/api/documentation#playlist
    #
    # Examples:
    class Playlist < Base
      belongs_to :user
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

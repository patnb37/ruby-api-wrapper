module Soundcloud
  module Models
    class User < Base
      has_many :tracks, :contacts, :comments, :favorites, :playlists
      has_many_unbulky_changeable :contacts, :favorites
      can_be_an_unbulky_changeable :contact
      
      cattr_accessor :element_name      
      self.element_name = 'user'
      
      def self.test1
        p self.ancestors
        p self.connection
      end
    end

    class Permission < User
    end
    
    class Contact < User
    end
    
    class Favorite < User
    end
  end
end


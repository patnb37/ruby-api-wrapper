module Soundcloud
  module Models
    
    # Soundcloud User resource
    #
    # Look up the resource attributes and filtering usage here:
    #    
    # http://wiki.github.com/soundcloud/api/documentation#user
    #
    # Examples:
    #   # gets the user with username userABC
    #   user = sc_client.User.find('userABC')
    #  
    #   # finds all users named joe and print their usernames    
    #   joes = sc_client.User.find(:all, :params=> {:q => "joe"})
    #   joes.each do |user|
    #     p user.username
    #   end
    #   
    #   # gets the logged-in user
    #   me = client.User.find_me
    #
    #   # checks if the first user named joe is following the second user named joe
    #   joe1 = joes.first
    #   joe2 = joes[1]
    #   joe1.has_contact?(joe2)
    #
    #   # makes the loggedin user following joe2
    #   joe2.add_contact!
    #
    #
    #   # Display all tracks of a user
    #   user = sc_client.User.find('some-user')
    #   user.tracks.each do |track|
    #     p  track.title
    #   end
    
    
    class User < Base
      has_many :tracks, :contacts, :comments, :favorites, :playlists
      has_many_single_changeable :contacts, :favorites
      can_be_a_single_changeable :contact
      
      cattr_accessor :element_name      
      self.element_name = 'user'

      # Convenience method to find the logged in user
      def self.find_me
        find(:one, :from => '/me')
      end
    end
    
    class Permission < User #:nodoc: 
    end
    
    class Contact < User #:nodoc:
    end
  end
end


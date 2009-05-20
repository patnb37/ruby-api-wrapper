module Soundcloud
  module Models
    
    
    # Gives you access to the Soundcloud User Resource
    #
    # Examples:
    #   user = client.User.find('userABC')
    #  => gets the user userABC
    #
    #   erics = client.User.find(:all, :params=> {:q => "eric"})
    #   erics.each do |user|
    #     p user.username
    #   end
    #  => finds all users named eric and print their usernames    
    #   
    #   me = client.User.find(:one, :from => '/me')
    #  => gets the logged-in user
    #
    #   eric1 = erics.first
    #   eric2 = erics[1]
    #   eric1.has_contact?(eric2)
    #  => checks if the first user named eric is following the second user named eric
    #
    #   eric2.add_contact!
    #  => makes the loggedin user following eric2
    
    class User < Base
      has_many :tracks, :contacts, :comments, :favorites, :playlists
      has_many_single_changeable :contacts, :favorites
      can_be_a_single_changeable :contact
      
      cattr_accessor :element_name      
      self.element_name = 'user'
    end
    
    class Permission < User
    end
    
    class Contact < User
    end
  end
end


module Soundcloud
  module Models
    
    # Soundcloud Event resource
    #
    # http://wiki.github.com/soundcloud/api/documentation#event
    #
    # Examples:
    #
    #   client.Event.find(:all,:params => {:filter => 'drop'})
    #  => get all dropbox events
    #    
    #   client.Event.find(:all)
    #  => get all events
    #
    class Event < Base    
      belongs_to :user, :track
      cattr_accessor :element_name    
      self.element_name = 'event'
    end    
  end
end

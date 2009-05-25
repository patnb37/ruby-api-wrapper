module Soundcloud
  module Models
    # Look up the resource attributes and filtering usage here:
    #
    # http://wiki.github.com/soundcloud/api/documentation#event
    #
    # Examples:
    #
    #   # find the last 50 (default soundcloud limit) dropbox events    
    #   sc_client.Event.find(:all,:params => {:filter => 'drop'})
    #    
    #   # find the last 50 (default soundcloud limit)  events    
    #   sc_client.Event.find(:all)
    #
    class Event < Base    
      belongs_to :user, :track
      cattr_accessor :element_name    
      self.element_name = 'event'
    end    
  end
end

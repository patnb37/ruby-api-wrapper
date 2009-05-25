module Soundcloud
  module Models
    # Note: At the moment, you can't create or delete playlists via Soundcloud API
    #
    # Look up the resource attributes and filtering usage here:
    #
    # http://wiki.github.com/soundcloud/api/documentation#playlist
    # 
    # Examples:
    #
    #   # Find a Playlist and add a track to it
    #   playlist = sc_client.Playlist('my-playlist')   
    #   track = sc_client.Track('my-track')
    #   playlist.tracks << track
    #   playlist.save   
    #
    #   # Allow a user to access this track
    #   some_user = sc_client.User.find('some-user')
    #   playlist.permissions << some_user
    #   playlist.permissions.save
    #
    #   # Delete first song in playlist
    #   playlist.tracks.delete playlist.tracks.first
    #   playlist.save
    #

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

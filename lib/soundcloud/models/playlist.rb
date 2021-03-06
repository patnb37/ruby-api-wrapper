module Soundcloud
  module Models
    # Note: At the moment, you can't create or delete playlists or change their permissions via Soundcloud API
    #
    # SC API Attributes (as of 26/05/09):
    # * created_at
    # * description
    # * genre
    # * id
    # * permalink
    # * title
    # * user_id
    # * permalink_url
    # * uri
    # * artwork_url
    # * duration
    # * type
    # * user (overwritten by wrapper)
    # * tracks (array)
    #
    # Custom Wrapper Attributes/Methods:
    # * user 
    #    
    # Look up the resource attributes and filtering usage here:
    #    
    # http://wiki.github.com/soundcloud/api/documentation#playlist
    # 
    # Examples:
    #
    #   # Find a Playlist and add a track to it
    #   playlist = sc_client.Playlist.find('my-playlist')   
    #   track = sc_client.Track.find('my-track')
    #   playlist.tracks << track
    #   playlist.save   
    #
    #   # Delete first song in playlist
    #   playlist.tracks.delete playlist.tracks.first
    #   playlist.save
    #

    class Playlist < Base
      belongs_to :user
      #      has_many :permissions
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

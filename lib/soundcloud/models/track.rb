module Soundcloud
  module Models  
    # Look up the resource attributes and filtering usage here:
    # 
    # SC API Attributes (as of 26/05/09):
    # * id
    # * user_id
    # * permalink
    # * description
    # * sharing
    # * bpm
    # * comments_count
    # * created_at
    # * downloadable
    # * downloads_count
    # * duration
    # * genre
    # * streamable
    # * uri
    # * user (overwritten by wrapper)
    # * permalink_url
    # * playback_count
    # * artwork_url
    # * waveform_url
    # * purchase_url
    # * stream_url
    # * user_playback_count
    # * user_favorite
    #
    # Custom Wrapper Attributes/Methods:
    # * user 
    # * permissions
    # * comments
    # * is_favorite?
    # * add_favorite!
    # * remove_favorite!
    # * asset_data (= File.new('/your file..'))
    # 
    # Look up the resource attributes and filtering usage here:
    #                          
    # http://wiki.github.com/soundcloud/api/documentation#track
    #
    # Examples:
    #
    #   some_user = sc_client.User.find('some_user')
    #    
    #   # gets 50 (Soundcloud API limit) tracks from some_user
    #   some_user_tracks = some_user.tracks
    #
    #   # gets the latest song from some_user_tracks
    #   first_song = some_user_tracks.first
    #
    #   # prints 50 (Soundcloud API limit) comments of first_song with username, timestamp (can be nil) and comment body
    #   first_song.comments.each do |comment| 
    #     if comment.timestamp.nil?
    #       timestamp = ""
    #     else
    #       timestamp = "@#{comment.timestamp/1000}"
    #     end
    #     p "#{comment.user.username} #{timestamp}: #{comment.body}"
    #   end
    #
    #   # downloads the original track file (track.downloadable must be true)
    #   # (the open call requires the 'open-uri' gem)
    #   downloaded_file = open first_song.download_url
    #
    #
    #   # gets 50 (Soundcloud API limit) tracks with a BPM <= 100    
    #   slow_tracks  = sc_client.Track.find(:all, :params => { "bpm[to]" => "100"} )
    #
    #
    #   # create a new Track on Soundcloud with some_sound_file.mp3 as asset data    
    #   new_track = sc_client.Track.new
    #   new_track.title = 'New Track'
    #   new_track.sharing = 'private'
    #   new_track.asset_data = File.new('some_sound_file.wav')
    #   new_track.save
    #
    #   # gives some_user permission to access the new_track    
    #   new_track.permissions << some_user
    #   new_track.permissions.save
    #
    
    class Track < Base
      belongs_to :user
      has_many :permissions, :comments
      can_be_a_single_changeable :favorite
            
      cattr_accessor :element_name
      self.element_name = 'track'
     
      def download_url
        raise Exception.new('Track is not downloadable') if not downloadable
        original_download_url = super       
        if sharing == "private" 
          begin
            response = connection.handle_response( self.class.oauth_connection.get( original_download_url ) )
            return original_download_url
          rescue ActiveResource::Redirection => redirection          
            return redirection.response['Location']
          end
        else
          return original_download_url
        end
      end
      
      # multipart stuff, to upload a soundfile 
        
      def set_asset_data(file)
        self.asset_data = file          
      end
        
      def update
        unless attributes[:asset_data].nil?
          raise 'Multipart update is NotImplemented'
          self.class.send_multipart_request(:put,'/tracks/#{self.id}','replacement[asset_data]',@asset_data)
        end
        super
      end
                
      def create
        if self.asset_data.nil?
          super
        else
         #post asset_data 
         
         # default to private
         if self.sharing?.nil? 
           self.sharing = 'private'
         end
         
         params = ActiveSupport::OrderedHash.new
         self.attributes.reject { |k,v| k.to_s == 'asset_data'}.each { |k,v| 
             params["track[#{k}]".to_sym] = v 
         }
         
         # ignore is added because the multipart gem is adding an extra new line 
         # to the last parameter which will break parsing of track[sharing]
         params[:ignore] = 'multipart bug'
         
         response = connection.handle_response(self.class.send_multipart_request(:post,'/tracks','track[asset_data]',self.asset_data,params))

         self.id = id_from_response(response)
         load_attributes_from_response(response)
         self.asset_data = nil
      end
    end      
  end    
  end
end

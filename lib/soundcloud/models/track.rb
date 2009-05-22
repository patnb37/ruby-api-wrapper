module Soundcloud
  module Models
    
    # Soundcloud Track resource
    #
    # http://wiki.github.com/soundcloud/api/documentation#track
    #
    # Examples:
    #
    #   some_user_tracks = client.Track.find(:all, :from => '/users/some_user/tracks')
    #  => gets the tracks from some_user
    #
    #   first_song = some_user_tracks.first
    #  => gets the first song from some_user_tracks
    #
    #   first_song.comments.each do |comment| 
    #     if comment.timestamp.nil?
    #       timestamp = ""
    #     else
    #       timestamp = "@#{comment.timestamp/1000}"
    #     end
    #     p "#{comment.user.username} #{timestamp}: #{comment.body}"
    #   end
    #  => Prints all comments of first_song with username, timestamp and  body
    #
    #
    #   slow_tracks  = client.Track.find(:all, :params => { "bpm[to]" => "100"} )
    #  => Gets tracks with a BPM <= 100
    #
    #   new_track = client.Track.new
    #   new_track.title = 'New Track'
    #   new_track.sharing = 'private'
    #   new_track.set_asset_data(File.new('some_sound_file.wav')
    #   new_track.save
    #  => Create a new Track on Soundcloud with some_sound_file.mp3 as asset data
    #   
    #   File.open('another_sound_file.wav', 'w') {|f| f.write( new_track.download ) }
    #  => Downloads the original soundfile. some_sound_file.wav and another_sound_file.wav should be equal
    #
    #   some_user = client.User.find('some_user')
    #   new_track.permissions << some_user
    #   new_track.permissions.save
    #  => Gives some_user permission to access the new_track
    #
    #  
    #
    #
    
    class Track < Base
      belongs_to :user
      has_many :permissions, :comments
      can_be_a_single_changeable :favorite
            
      cattr_accessor :element_name
      self.element_name = 'track'
      
      
     
      def download
        raise Exception.new('Track is not downloadable') if not downloadable
        begin
          response = connection.handle_response( self.class.oauth_connection.get(download_url) )
        rescue ActiveResource::Redirection => redirection          
          response = Net::HTTP.get(URI.parse(redirection.response['Location']))
        end
        return response
      end
      
      # multipart stuff, to upload a soundfile 
          
      @asset_data = nil
      def set_asset_data(file)
        @asset_data = file          
      end
        
      def update
        if not @asset_data.nil?
          raise 'Multipart update is NotImplemented'
          self.class.send_multipart_request(:put,'/tracks/#{self.id}','replacement[asset_data]',@asset_data)
        end
        super
      end
                
      def create
        if @asset_data.nil?
          super
        else
         #post asset_data            
         params = {'track[title]' => self.title,'track[sharing]' => self.sharing}
         response = connection.handle_response(self.class.send_multipart_request(:post,'/tracks','track[asset_data]',@asset_data,params))
         self.id = id_from_response(response)
         @asset_data = nil
         # second, 'normal' update request
         update
      end
    end      
  end    
  end
end

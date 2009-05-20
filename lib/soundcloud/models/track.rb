module Soundcloud
  module Models
    
    # Gives you access to the Track resources on Soundcloud
    #
    # Examples:
    #
    #   someuser_tracks = client.Track.find(:all, :from => '/users/someuser/tracks')
    #  => gets the tracks from someuser
    #
    #   slow_tracks  = client.Track.find(:all, :params => { "bpm[to]" => "100"} )
    #  => Gets tracks with a BPM <= 100
    class Track < Base
      has_many :permissions, :comments
      can_be_a_single_changeable :favorite
            
      cattr_accessor :element_name
      self.element_name = 'track'
      
      
      # TODO works only with oauth
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

module Soundcloud
  module Models
    class Track < Base
      has_many :permissions, :comments
      can_be_a_single_changeable :favorite
            
      cattr_accessor :element_name
      self.element_name = 'track'
      
      
      # multipart stuff, to upload a soundfile 
          
      @asset_data = nil
      def set_asset_data(file)
        @asset_data = file          
      end
        
      def update
        if not @asset_data.nil?
          raise 'NotImplemented'
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
         response = self.class.send_multipart_request(:post,'/tracks','track[asset_data]',@asset_data,params)
         self.id = id_from_response(response)            
         @asset_data = nil
         # second, 'normal' update request
         update
      end
    end      
  end    
  end
end

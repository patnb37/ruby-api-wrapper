require 'spec_helper'


describe 'Soundcloud::Models::Playlist' do
   before(:all) do
    @sc = Soundcloud.register({:access_token=> valid_oauth_access_token, :site => soundcloud_site})
    @api_test_1 = @sc.User.find('api-test-1')   
    @api_test_2 = @sc.User.find('api-test-2')   
    @api_test_3 = @sc.User.find('api-test-3')
    
  end  
  
  it 'should be able to create and deleta a new playlist' do
    # TODO is not implemented in the soundcloud api
    #    pl = @sc.Playlist.new
    #   pl.title = 'Static Test Playlist'
    #     pl.tracks << @sc.Track.find('static-test-track')    
    
    #   p pl.to_xml
    #   pl.save
  end
  
  it 'should be able to find an existing playlist' do 
    pl = @sc.Playlist.find('static-test-playlist')
    pl.tracks.count.should be >= 3    
  end
  
  it 'should be able to delete tracks of a playlist and put them back' do 
    pl = @sc.Playlist.find('my-static-playlist')    
    old_count = pl.tracks.count
    deleted_track = pl.tracks.first
    pl.tracks.delete_at 0
    pl.save
    pl.tracks.count.should be == old_count -1
    
    pl.tracks << deleted_track
    pl.save
    pl.tracks.count.should be == old_count
  end
  
  
end

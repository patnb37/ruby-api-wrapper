require 'spec_helper'

describe 'Soundcloud::Models::Comment' do
   before(:all) do
    @sc = Soundcloud.register({:access_token=> valid_oauth_access_token, :site => soundcloud_site})
    @api_test_1 = @sc.User.find('api-test-1')    
    @api_test_2 = @sc.User.find('api-test-2')    
    @api_test_3 = @sc.User.find('api-test-3')  
  end
  
  it 'should be able to create a new comment for a track' do
    tr = @sc.Track.find('static-test-track')
    old_count = tr.comments.count  
    @sc.Comment.create({:track_id => tr.id, :body => "new API Test comment"})
    tr.comments.reload.count.should be old_count + 1
  end
  
  
  
  
end

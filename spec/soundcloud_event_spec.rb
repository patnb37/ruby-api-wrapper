require 'spec_helper'

describe 'Soundcloud::Models::Event' do
   before(:all) do
    @sc = Soundcloud.register({:access_token=> valid_oauth_access_token, :site => soundcloud_site})
  #  @api_test_1 = @sc.User.find('api-test-1')    
 #   @api_test_2 = @sc.User.find('api-test-2')    
#    @api_test_3 = @sc.User.find('api-test-3')  
  end
  
  it 'should get the last events' do
    events = @sc.Event.find(:all)
  end
  
  it 'should get a fan event and should provide the user resource' do
    fan_events = @sc.Event.find(:all,:params => {:type => 'Fan'})
    fan_events.first.user.username.should_not be nil
  end
end

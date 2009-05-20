require 'spec'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))


require 'soundcloud'

Spec::Runner.configure do |config|
  
end

def soundcloud_site
  'http://api.sandbox-soundcloud.com'
end

def valid_oauth_access_token
  access_token = '2OrtU756yB87XrV09LQK5g'
  access_secret = 'Y0mcUHPlkKmSgVGSdFAqiqnx6noGtgQv5rHYgq6jVk'
  consumer_token = 'z8DueHG2qA6wrccaei9Lw'
  consumer_secret = '3AmT3KFGGa17LRCV65HQZ9F1qFEQ8dIGr4DuuK0aY'

  sc_consumer = Soundcloud.consumer(consumer_token,consumer_secret,soundcloud_site)
  return OAuth::AccessToken.new(sc_consumer, access_token, access_secret)
end


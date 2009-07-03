# This is a ruby wrapper for the soundcloud API
#
# Author:: Johannes Wagener (johannes@wagener.cc)

require 'rubygems'

gem 'oauth', '0.3.4'
require 'oauth'

gem 'jwagener-oauth-active-resource'
require 'oauth_active_resource'

module Soundcloud  
   # Will create an OAuth Consumer for you.
   #
   # You have to register your application on soundcloud.com to get a consumer token and secret.
   #
   # Optionally you can specify another provider site (i.e. http://api.sandbox-soundcloud.com)
   #
   # Default provider site is http://api.soundcloud.com
   def self.consumer(consumer_token,consumer_secret, site = 'http://api.soundcloud.com')
    return OAuth::Consumer.new(consumer_token, consumer_secret, {
        :site               => site,
        :request_token_path => "/oauth/request_token",
        :access_token_path  => "/oauth/access_token",
        :authorize_path     => "/oauth/authorize",
        :scheme             => :query_string
      })    
  end


  # Will create a soundcloud module containing all the soundcloud models.
  # This module is bound to the given OAuth access token.
  # 
  # Options:
  #  :access_token = your oauth access token
  #  :site = soundcloud api site (i.e. "http://api.sandbox-soundcloud.com", defaults to "http://api.soundcloud.com")
  # Examples:
  #
  #   # unauthenticated to "http://api.soundcloud.com"  
  #   cl = Soundcloud.register()
  #
  #   # authenticated connection to soundcloud sandbox
  #   cl = Soundcloud.register({:access_token => your_access_token, :site => "http://api.sandbox-soundcloud.com"})
  #
  def self.register(options = {})
    options[:site] = options[:site] || 'http://api.soundcloud.com'
    OAuthActiveResource.register(self.ancestors.first, self.ancestors.first.const_get('Models'), options)
  end
end

require 'soundcloud/models/base'
require 'soundcloud/models/user'
require 'soundcloud/models/comment'
require 'soundcloud/models/event'
require 'soundcloud/models/playlist'
require 'soundcloud/models/track'


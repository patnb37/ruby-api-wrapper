# This is a ruby wrapper for the soundcloud API
#
# Author:: Johannes Wagener (johannes@wagener.cc)

require 'rubygems'

gem 'oauth'
require 'oauth'

gem 'oauth-active-resource'
require 'oauth_active_resource'

module Soundcloud  
   def self.consumer(consumer_token,consumer_secret, provider_site = 'http://api.soundcloud.com')
    return OAuth::Consumer.new(consumer_token, consumer_secret, {
        :site               => provider_site,
        :request_token_path => "/oauth/request_token",
        :access_token_path  => "/oauth/access_token",
        :authorize_path     => "/oauth/authorize",
        :scheme             => :query_string
      })    
  end

  def self.register(oauth_connection=nil)
    OAuthActiveResource.register(self.ancestors.first, self.ancestors.first.const_get('Models'), oauth_connection)
  end
end

require 'soundcloud_gem/lib/soundcloud/models/base'
require 'soundcloud_gem/lib/soundcloud/models/user'
require 'soundcloud_gem/lib/soundcloud/models/comment'
require 'soundcloud_gem/lib/soundcloud/models/event'
require 'soundcloud_gem/lib/soundcloud/models/playlist'
require 'soundcloud_gem/lib/soundcloud/models/track'


require 'json'
require 'httparty'

class Api
  include HTTParty

  base_uri 'https://amidouserprofile.azure-api.net/client/api'

  def initialize(subscription_key)
    @subscription_key = subscription_key
  end

  def post(uri, profile)
    self.class.post uri, :body => profile, :headers => { :'Content-Type' => 'application/json', :'ocp-apim-subscription' => @subscription_key }
  end
end
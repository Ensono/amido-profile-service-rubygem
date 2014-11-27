require 'json'
require 'httparty'

class Api
  include HTTParty

  def initialize(subscription_key)
    throw :no_subscription_key_provided if subscription_key.nil?

    @subscription_key = subscription_key
  end

  def post(uri, profile, delegate_token = nil)
    self.class.post uri, :body => safe_convert_body_to_json(profile), :headers => create_headers(delegate_token)
  end

  def put(uri, profile, delegate_token = nil)
    self.class.put uri, :body => safe_convert_body_to_json(profile), :headers => create_headers(delegate_token)
  end

  def get(uri, delegate_token = nil)
    self.class.get uri, :headers => create_headers(delegate_token)
  end

  def delete(uri, delegate_token = nil)
    self.class.delete uri, :headers => create_headers(delegate_token)
  end

  private

  def create_headers(delegate_token)
    headers = {
        'content-type' => 'application/json',
        'ocp-apim-subscription-key' => @subscription_key
    }

    headers['x-zumo-auth'] = delegate_token unless delegate_token.nil?

    headers
  end

  def safe_convert_body_to_json(profile)
    converted_profile = {}.to_json
    converted_profile = profile.to_json unless profile.nil?
    converted_profile
  end
end
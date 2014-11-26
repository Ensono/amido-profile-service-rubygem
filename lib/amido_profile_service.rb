require 'amidoprofileservice/version'
require 'amidoprofileservice/api'
require 'amidoprofileservice/profile_service_uri'

class AmidoProfileService
  def initialize(subscription_key)
    throw :no_subscription_key if subscription_key.nil?
    @subscription_key = subscription_key

    @api = Api.new(subscription_key)
  end

=begin
    createProfile
    POST https://amidouserprofile.azure-api.net/client/api/profiles/<realm>/<userId>
    ocp-apim-subscription-key: <subscription key>
    [if delegateToken]
      x-zumo-auth: <delegate token here>
    [/endif]
    content type: application/json; charset=utf-8
    data type: json
    { JSON payload }
=end

  def create_profile(realm, user_id, profile)
    throw :no_realm_passed if realm.nil?
    throw :no_user_id_passed if user_id.nil?

    uri = ProfileServiceUri.create_profile realm, user_id

    result = Api.post(uri, profile)

  end


end

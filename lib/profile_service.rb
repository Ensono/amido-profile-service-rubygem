require 'profile-service/version'

class ProfileService
  def initialize(subscription_key)
    throw :no_subscription_key if subscription_key.nil?
    @subscription_key = subscription_key
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

  def create_profile(user_id, profile)
    throw :no_user_id_passed if user_id.nil?
  end


end

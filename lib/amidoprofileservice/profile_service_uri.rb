require 'open-uri'

class ProfileServiceUri
  def self.base_url
    'https://amidouserprofile.azure-api.net/client/api'
  end

  def self.profile(realm, user_id)
    "#{base_url}/profiles/#{URI::encode(realm)}/#{URI::encode(user_id)}"
  end

  def self.nested_profile(realm, user_id)
    "#{base_url}/nestedprofiles/#{URI::encode(realm)}/#{URI::encode(user_id)}"
  end
end
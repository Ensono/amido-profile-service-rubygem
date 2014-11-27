require 'open-uri'

class ProfileServiceUri
  def self.base_url
    'https://amidouserprofile.azure-api.net/client/api'
  end

  def self.profile(realm, user_id)
    "#{base_url}/profiles/#{URI::encode(realm)}/#{URI::encode(user_id)}"
  end

  def self.is_profile_complete(realm, user_id)
    "#{base_url}/profiles/#{URI::encode(realm)}/#{URI::encode(user_id)}/status"
  end

  def self.nested_profile(realm, user_id)
    "#{base_url}/nestedprofiles/#{URI::encode(realm)}/#{URI::encode(user_id)}"
  end

  def self.nested_fieldset(realm, fieldset_name)
    "#{base_url}/nestedfieldsets/#{URI::encode(realm)}/#{URI::encode(fieldset_name)}"
  end

  def self.fieldset(realm, fieldset_name)
    "#{base_url}/fieldsets/#{URI::encode(realm)}/#{URI::encode(fieldset_name)}"
  end
end
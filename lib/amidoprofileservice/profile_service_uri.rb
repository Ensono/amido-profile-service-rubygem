class ProfileServiceUri
  def self.base_url
    'https://amidouserprofile.azure-api.net/client/api'
  end

  def self.create_profile(realm, user_id)
    "#{base_url}/profiles/#{realm}/#{user_id}"
  end
end
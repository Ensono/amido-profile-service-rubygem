class Uri
  def self.base_uri
    'https://amidouserprofile.azure-api.net/client/api/'
  end

  def self.create_profile(realm, user_id)
    "#{base_uri}profiles/#{realm}/#{user_id}"
  end
end
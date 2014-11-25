class ProfileServiceUri
  def self.create_profile(realm, user_id)
    "/profiles/#{realm}/#{user_id}"
  end
end
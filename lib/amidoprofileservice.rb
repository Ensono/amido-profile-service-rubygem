require 'amidoprofileservice/version'
require 'amidoprofileservice/api'
require 'amidoprofileservice/profile_service_uri'
require 'amidoprofileservice/profile_service_result'

class AmidoProfileService
  attr_accessor :api

  def initialize(subscription_key)
    throw :no_subscription_key if subscription_key.nil?
    @subscription_key = subscription_key

    @api = Api.new(subscription_key)
  end

  def create_profile(realm, user_id, delegate_token, profile = {})
    throw :no_realm_passed if realm.nil?
    throw :no_user_id_passed if user_id.nil?
    throw :no_delegate_token_passed if delegate_token.nil?

    uri = ProfileServiceUri.profile realm, user_id

    result = @api.post(uri, profile, delegate_token)

    ProfileServiceResult.new(result)
  end

  def update_profile(realm, user_id, delegate_token, profile = {})
    throw :no_realm_passed if realm.nil?
    throw :no_user_id_passed if user_id.nil?
    throw :no_delegate_token_passed if delegate_token.nil?

    uri = ProfileServiceUri.profile realm, user_id

    result = @api.put(uri, profile, delegate_token)

    ProfileServiceResult.new(result)
  end

  def get_profile(realm, user_id, delegate_token)
    throw :no_realm_passed if realm.nil?
    throw :no_user_id_passed if user_id.nil?
    throw :no_delegate_token_passed if delegate_token.nil?

    uri = ProfileServiceUri.profile realm, user_id

    result = @api.get(uri, delegate_token)

    ProfileServiceResult.new(result)
  end

  def get_nested_profile(realm, user_id, delegate_token)
    throw :no_realm_passed if realm.nil?
    throw :no_user_id_passed if user_id.nil?
    throw :no_delegate_token_passed if delegate_token.nil?

    uri = ProfileServiceUri.nested_profile realm, user_id

    result = @api.get(uri, delegate_token)

    ProfileServiceResult.new(result)
  end

  def is_profile_complete(realm, user_id, delegate_token)
    throw :no_realm_passed if realm.nil?
    throw :no_user_id_passed if user_id.nil?
    throw :no_delegate_token_passed if delegate_token.nil?

    uri = ProfileServiceUri.is_profile_complete realm, user_id

    result = @api.get(uri, delegate_token)

    ProfileServiceResult.new(result)
  end

  def get_nested_fieldset(realm, fieldset_name)
    throw :no_realm_passed if realm.nil?
    throw :no_fieldsetname_passed if fieldset_name.nil?

    uri = ProfileServiceUri.nested_fieldset realm, fieldset_name

    result = @api.get(uri)

    ProfileServiceResult.new(result)
  end

  def get_fieldset(realm, fieldset_name)
    throw :no_realm_passed if realm.nil?
    throw :no_fieldsetname_passed if fieldset_name.nil?

    uri = ProfileServiceUri.fieldset realm, fieldset_name

    result = @api.get(uri)

    ProfileServiceResult.new(result)
  end
end

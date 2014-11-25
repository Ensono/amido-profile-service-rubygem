require 'minitest/autorun'
require 'profile_service'

class ProfileServiceTest < MiniTest::Unit::TestCase
  def test_constructor_takes_parameter
    profile_service = ProfileService.new('subscription_key')

    assert_instance_of ProfileService, profile_service
  end

  def test_constructor_throws_error_if_empty_parameter_passed
    assert_throws :no_subscription_key do
      ProfileService.new(nil)
    end
  end

end
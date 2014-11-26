require 'spec_helper'

describe Amidoprofileservice do

  before do
    @service = Amidoprofileservice.new('subscription_key')
  end

  describe '#constructor' do
    it 'should throw an error when no parameter is passed' do
      expect { Amidoprofileservice.new(nil) }.to throw_symbol(:no_subscription_key)
    end
  end

  describe '#create_profile' do

    it 'should throw an error when no realm is passed' do
      expect { @service.create_profile(nil, nil, nil) }.to throw_symbol(:no_realm_passed)
    end


    it 'should throw an error when no user id is passed' do
      expect { @service.create_profile('sldkjflskdjf', nil, nil) }.to throw_symbol(:no_user_id_passed)
    end

    valid_realm = 'my.realm.com'
    valid_user_id = 'user_id'

    resulting_url = 'https://amidouserprofile.azure-api.net/client/api/some_uri'

    it 'should load the uri using the parameters' do
      allow(ProfileServiceUri).to receive(:create_profile).with(valid_realm, valid_user_id).and_return(resulting_url)

      @service.create_profile valid_realm, valid_user_id, {}
    end

    it 'should call post on the api with the correct parameters' do
      profile = { :name => 'dave' }

      allow(ProfileServiceUri).to receive(:create_profile).with(valid_realm, valid_user_id).and_return(resulting_url)
      allow(Api).to receive(:post).with(resulting_url, profile)

      expect(ProfileServiceUri).to receive(:create_profile).with(valid_realm, valid_user_id)
      expect(Api).to receive(:post).with(resulting_url, profile)

      @service.create_profile valid_realm, valid_user_id, profile
    end
  end

end
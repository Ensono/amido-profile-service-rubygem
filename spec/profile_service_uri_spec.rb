require 'spec_helper'

describe ProfileServiceUri do

  describe '#profile' do

    it 'should build the uri correctly' do
      expect(ProfileServiceUri.profile 'my.realm.com', 'my_user_id').to eq('https://amidouserprofile.azure-api.net/client/api/profiles/my.realm.com/my_user_id')
    end

  end
  describe '#is_profile_complete' do

    it 'should build the uri correctly' do
      expect(ProfileServiceUri.is_profile_complete 'my.realm.com', 'my_user_id').to eq('https://amidouserprofile.azure-api.net/client/api/profile/my.realm.com/my_user_id/status')
    end

  end

  describe '#nested_profile' do

    it 'should build the uri correctly' do
      expect(ProfileServiceUri.nested_profile 'my.realm.com', 'my_user_id').to eq('https://amidouserprofile.azure-api.net/client/api/nestedprofiles/my.realm.com/my_user_id')
    end

  end

  describe '#nested_fieldset' do

    it 'should build the uri correctly' do
      expect(ProfileServiceUri.nested_fieldset 'my.realm.com', 'register').to eq('https://amidouserprofile.azure-api.net/client/api/nestedfieldsets/my.realm.com/register')
    end

  end

  describe '#fieldset' do

    it 'should build the uri correctly' do
      expect(ProfileServiceUri.fieldset 'my.realm.com', 'register').to eq('https://amidouserprofile.azure-api.net/client/api/fieldsets/my.realm.com/register')
    end

  end

end
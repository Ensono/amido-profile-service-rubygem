require 'spec_helper'

describe ProfileServiceUri do

  describe '#profile' do

    it 'should build the uri correctly' do
      expect(ProfileServiceUri.profile 'my.realm.com', 'my_user_id').to eq('https://amidouserprofile.azure-api.net/client/api/profiles/my.realm.com/my_user_id')
    end

  end

  describe '#nested_profile' do

    it 'should build the uri correctly' do
      expect(ProfileServiceUri.nested_profile 'my.realm.com', 'my_user_id').to eq('https://amidouserprofile.azure-api.net/client/api/nestedprofiles/my.realm.com/my_user_id')
    end

  end

end
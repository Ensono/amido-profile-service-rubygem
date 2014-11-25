require 'spec_helper'

describe ProfileServiceUri do

  describe '#create_profile' do

    it 'should build the uri correctly' do
      expect(ProfileServiceUri.create_profile 'my.realm.com', 'my_user_id').to eq('/profiles/my.realm.com/my_user_id')
    end

  end

end
require 'spec_helper'

describe Uri do

  describe '#create_profile' do

    it 'should build the uri correctly' do
      expect(Uri.create_profile 'my.realm.com', 'my_user_id').to eq('https://amidouserprofile.azure-api.net/client/api/my.realm.com/my_user_id')
    end

  end

end
require 'spec_helper'

describe ProfileService do

  describe '#constructor' do
    it 'should throw an error when no parameter is passed' do
      expect { ProfileService.new(nil) }.to throw_symbol(:no_subscription_key)
    end
  end

  describe '#create_profile' do
    before do
      @service = ProfileService.new('subscription_key')
    end

    it 'should throw and error when no user id is passed' do
      expect { @service.create_profile(nil, nil) }.to throw_symbol(:no_user_id_passed)
    end
  end

end
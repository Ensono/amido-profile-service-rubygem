require 'spec_helper'

describe AmidoProfileService do

  before(:all) do
    @service = AmidoProfileService.new('subscription_key')
    @valid_realm = 'my.realm.com'
    @valid_user_id = 'facebook|r098098fk3r'
    @valid_fieldset_name = 'register'
    @valid_delegate_token = 'fljhdsf87s89d7f98s7df98s7df987f'
    @profile = { :name => 'dave' }
    @resulting_url = 'https://amidouserprofile.azure-api.net/client/api/some_uri'
  end

  before(:each) do
    @success_result = double('response')
    allow(@success_result).to receive(:code).and_return(201)
    allow(@success_result).to receive(:parsed_response).and_return(@profile)
  end

  describe '#constructor' do

    it 'should throw an error when no parameter is passed' do
      expect { AmidoProfileService.new(nil) }.to throw_symbol(:no_subscription_key)
    end

    it 'should create an instance of the API' do
      expect(@service.api).to be_instance_of Api
    end

  end

  describe '#create_profile' do

    it 'should throw an error when no realm is passed' do
      expect { @service.create_profile(nil, nil, nil) }.to throw_symbol(:no_realm_passed)
    end

    it 'should throw an error when no user id is passed' do
      expect { @service.create_profile(@valid_realm, nil, nil) }.to throw_symbol(:no_user_id_passed)
    end

    it 'should throw an error when no delegate token is passed' do
      expect { @service.create_profile(@valid_realm, @valid_user_id, nil) }.to throw_symbol(:no_delegate_token_passed)
    end

    it 'should call post on the api with the correct parameters and return an OK result' do

      allow(ProfileServiceUri).to receive(:profile).with(@valid_realm, @valid_user_id).and_return(@resulting_url)

      expect(ProfileServiceUri).to receive(:profile).with(@valid_realm, @valid_user_id)

      api = double('api')
      allow(api).to receive(:post).with(@resulting_url, @profile, @valid_delegate_token).and_return @success_result
      @service.api = api
      result = @service.create_profile @valid_realm, @valid_user_id, @valid_delegate_token, @profile

      expect(result).to be_instance_of(ProfileServiceResult)
      expect(result.code).to eq(:OK)
      expect(result.body).to eq(@profile)
    end

  end

  describe '#update_profile' do

    it 'should throw an error when no realm is passed' do
      expect { @service.update_profile(nil, nil, nil) }.to throw_symbol(:no_realm_passed)
    end

    it 'should throw an error when no user id is passed' do
      expect { @service.update_profile(@valid_realm, nil, nil) }.to throw_symbol(:no_user_id_passed)
    end

    it 'should throw an error when no delegate token is passed' do
      expect { @service.update_profile(@valid_realm, @valid_user_id, nil) }.to throw_symbol(:no_delegate_token_passed)
    end

    it 'should call put on the api with the correct parameters and return an OK result' do

      allow(ProfileServiceUri).to receive(:profile).with(@valid_realm, @valid_user_id).and_return(@resulting_url)

      expect(ProfileServiceUri).to receive(:profile).with(@valid_realm, @valid_user_id)

      api = double('api')
      allow(api).to receive(:put).with(@resulting_url, @profile, @valid_delegate_token).and_return @success_result
      @service.api = api
      result = @service.update_profile @valid_realm, @valid_user_id, @valid_delegate_token, @profile

      expect(result).to be_instance_of(ProfileServiceResult)
      expect(result.code).to eq(:OK)
      expect(result.body).to eq(@profile)
    end

  end

  describe '#get_profile' do

    it 'should throw an error when no realm is passed' do
      expect { @service.get_profile(nil, nil, nil) }.to throw_symbol(:no_realm_passed)
    end

    it 'should throw an error when no user id is passed' do
      expect { @service.get_profile(@valid_realm, nil, nil) }.to throw_symbol(:no_user_id_passed)
    end

    it 'should throw an error when no delegate token is passed' do
      expect { @service.get_profile(@valid_realm, @valid_user_id, nil) }.to throw_symbol(:no_delegate_token_passed)
    end

    it 'should call get on the api with the correct parameters and return an OK result' do

      allow(ProfileServiceUri).to receive(:profile).with(@valid_realm, @valid_user_id).and_return(@resulting_url)

      expect(ProfileServiceUri).to receive(:profile).with(@valid_realm, @valid_user_id)

      api = double('api')
      allow(api).to receive(:get).with(@resulting_url, @valid_delegate_token).and_return @success_result
      @service.api = api
      result = @service.get_profile @valid_realm, @valid_user_id, @valid_delegate_token

      expect(result).to be_instance_of(ProfileServiceResult)
      expect(result.code).to eq(:OK)
      expect(result.body).to eq(@profile)
    end

  end

  describe '#get_nested_profile' do

    it 'should throw an error when no realm is passed' do
      expect { @service.get_profile(nil, nil, nil) }.to throw_symbol(:no_realm_passed)
    end

    it 'should throw an error when no user id is passed' do
      expect { @service.get_profile(@valid_realm, nil, nil) }.to throw_symbol(:no_user_id_passed)
    end

    it 'should throw an error when no delegate token is passed' do
      expect { @service.get_profile(@valid_realm, @valid_user_id, nil) }.to throw_symbol(:no_delegate_token_passed)
    end

    it 'should call get on the api with the correct parameters and return an OK result' do

      allow(ProfileServiceUri).to receive(:nested_profile).with(@valid_realm, @valid_user_id).and_return(@resulting_url)

      expect(ProfileServiceUri).to receive(:nested_profile).with(@valid_realm, @valid_user_id)

      api = double('api')
      allow(api).to receive(:get).with(@resulting_url, @valid_delegate_token).and_return @success_result
      @service.api = api
      result = @service.get_nested_profile @valid_realm, @valid_user_id, @valid_delegate_token

      expect(result).to be_instance_of(ProfileServiceResult)
      expect(result.code).to eq(:OK)
      expect(result.body).to eq(@profile)
    end

  end

  describe '#get_nested_fieldset' do

    it 'should throw an error when no realm is passed' do
      expect { @service.get_nested_fieldset(nil, nil) }.to throw_symbol(:no_realm_passed)
    end
    it 'should throw an error when no fieldset name is passed' do
      expect { @service.get_nested_fieldset(@valid_realm, nil) }.to throw_symbol(:no_fieldsetname_passed)
    end

    it 'should call get on the api with the correct parameters and return an OK result' do

      allow(ProfileServiceUri).to receive(:nested_fieldset).with(@valid_realm, @valid_fieldset_name).and_return(@resulting_url)

      expect(ProfileServiceUri).to receive(:nested_fieldset).with(@valid_realm, @valid_fieldset_name)

      api = double('api')
      allow(api).to receive(:get).with(@resulting_url).and_return @success_result
      @service.api = api
      result = @service.get_nested_fieldset @valid_realm, @valid_fieldset_name

      expect(result).to be_instance_of(ProfileServiceResult)
      expect(result.code).to eq(:OK)
      expect(result.body).to eq(@profile)
    end

  end

  describe '#get_fieldset' do

    it 'should throw an error when no realm is passed' do
      expect { @service.get_fieldset(nil, nil) }.to throw_symbol(:no_realm_passed)
    end
    it 'should throw an error when no fieldset name is passed' do
      expect { @service.get_fieldset(@valid_realm, nil) }.to throw_symbol(:no_fieldsetname_passed)
    end

    it 'should call get on the api with the correct parameters and return an OK result' do

      allow(ProfileServiceUri).to receive(:fieldset).with(@valid_realm, @valid_fieldset_name).and_return(@resulting_url)

      expect(ProfileServiceUri).to receive(:fieldset).with(@valid_realm, @valid_fieldset_name)

      api = double('api')
      allow(api).to receive(:get).with(@resulting_url).and_return @success_result
      @service.api = api
      result = @service.get_fieldset @valid_realm, @valid_fieldset_name

      expect(result).to be_instance_of(ProfileServiceResult)
      expect(result.code).to eq(:OK)
      expect(result.body).to eq(@profile)
    end

  end

end
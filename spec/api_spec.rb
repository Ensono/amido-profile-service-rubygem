require 'spec_helper'
require 'json'

describe Api do

  before(:all) do
    @api_key = 'subscription_key'
    @api = Api.new(@api_key)
    @profile = { 'name' => 'michael' }
    @delegate_token = '8975465d465sf6s5d65d4f6sfs6d5f4s6d54f6s5d4fs5d46'
    @profile_as_json = @profile.to_json
  end

  describe '#constructor' do
    it 'should take a subscription key as a parameter' do
      expect(Api.new(@api_key)).to be_instance_of Api
    end

    it 'should throw an error if no key is passed' do
      expect { Api.new(nil) }.to throw_symbol :no_subscription_key_provided
    end
  end

  describe '#post' do
    it 'should call post on HTTParty with the correct converted parameters' do
      allow(Api).to receive(:post)

      expect(Api).to receive(:post).with('uri', hash_including(:body => @profile_as_json, :headers => { 'content-type' => 'application/json', 'ocp-apim-subscription-key' => @api_key, 'x-zumo-auth' => @delegate_token }))

      @api.post('uri', @profile, @delegate_token)
    end
  end

  describe '#put' do
    it 'should call put on HTTParty with the correct converted parameters' do
      allow(Api).to receive(:put)

      expect(Api).to receive(:put).with('uri', hash_including(:body => @profile_as_json, :headers => { 'content-type' => 'application/json', 'ocp-apim-subscription-key' => @api_key, 'x-zumo-auth' => @delegate_token }))

      @api.put('uri', @profile, @delegate_token)
    end
  end

  describe '#get' do
    describe 'when called with delegate token' do
      it 'should call get on HTTParty with the correct converted parameters' do
        allow(Api).to receive(:get)

        expect(Api).to receive(:get).with('uri', hash_including(:headers => { 'content-type' => 'application/json', 'ocp-apim-subscription-key' => @api_key, 'x-zumo-auth' => @delegate_token }))

        @api.get('uri', @delegate_token)
      end
    end

    describe 'when called without a delegate token' do
      it 'should call get on HTTParty with the correct converted parameters without the auth header ' do
        allow(Api).to receive(:get)

        expect(Api).to receive(:get).with('uri', hash_excluding(:headers => { 'x-zumo-auth' => @delegate_token }))

        @api.get('uri', @delegate_token)
      end
    end

  end

  describe '#delete' do
    it 'should call delete on HTTParty with the correct converted parameters' do
      allow(Api).to receive(:delete)

      expect(Api).to receive(:delete).with('uri', hash_including(:headers => { 'content-type' => 'application/json', 'ocp-apim-subscription-key' => @api_key, 'x-zumo-auth' => @delegate_token }))

      @api.delete('uri', @delegate_token)
    end
  end
end
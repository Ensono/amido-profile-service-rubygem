require 'spec_helper'

def expect_code(status_code, expected_result)
  success_result = double('response')
  allow(success_result).to receive(:code).and_return(status_code)
  allow(success_result).to receive(:parsed_response).and_return({ :body => true })

  res = ProfileServiceResult.new(success_result)

  expect(res.code).to eq expected_result
  expect(res.status_code).to eq(status_code)
end

describe ProfileServiceResult do
  describe '#constructor' do
    it 'should set the OK code based on the response supplied' do
      expect_code 201, :OK
    end

    it 'should set the REDIRECT code based on the response supplied' do
      expect_code 301, :REDIRECT
    end

    it 'should set the CLIENT_ERROR code based on the response supplied' do
      expect_code 401, :CLIENT_ERROR
    end

    it 'should set the SERVER_ERROR code based on the response supplied' do
      expect_code 501, :SERVER_ERROR
    end

    it 'should set the SERVER_ERROR code based on the response supplied' do
      expect_code 600, :UNKNOWN_ERROR
    end

    it 'should set the body based on the response supplied' do
      success_result = double('response')
      allow(success_result).to receive(:code).and_return(201)
      body_hash = {:body => true}
      allow(success_result).to receive(:parsed_response).and_return(body_hash)

      res = ProfileServiceResult.new(success_result)

      expect(res.body).to eq(body_hash)
    end
  end
end
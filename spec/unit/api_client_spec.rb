require 'spec_helper'

describe Typekitter::ApiClient do
  describe '#kits_create' do
    context 'require to typekit api fails' do
      it 'returns a parsed string of error messages' do
        json_response = "{\"errors\":[\"failed\"]}"
        parsed_errors = "An error occured: #{json_response}"
        fake_token = double("token", value: 'fake token 1234')
        stub_request(:post, "https://typekit.com/api/v1/json/kits").
          with(:headers => {
          'User-Agent'=>'Typhoeus - https://github.com/typhoeus/typhoeus',
          'X-Typekit-Token'=>/.*/}).
          to_return(:status => 401, :body => json_response, :headers => {})
        client = Typekitter::ApiClient.new
        allow(Typekitter::Token).to receive(:load).and_return(fake_token)

        response = client.kits_create

        expect(response).to eq(parsed_errors)
      end
    end
  end

  describe '#kits_index' do
    context 'request to typekit api is successful' do
      it 'returns a parsed string of typekit kits' do
        json_response = "{\"foo\":[\"success\"]}"
        parsed_kits = JSON.parse(json_response)
        fake_token = double("token", value: 'fake token 1234')
        stub_request(:get, "https://typekit.com/api/v1/json/kits").
         with(:headers => {
          'User-Agent'=>'Typhoeus - https://github.com/typhoeus/typhoeus',
          'X-Typekit-Token'=>/.*/}).
         to_return(:status => 200, :body => json_response, :headers => {})
        client = Typekitter::ApiClient.new
        allow(Typekitter::Token).to receive(:load).and_return(fake_token)

        response = client.kits_index

        expect(response).to eq(parsed_kits)
      end
    end

    context 'request to typekit api fails' do
      it 'returns a parsed string of error messages' do
        json_response = "{\"errors\":[\"failure\"]}"
        parsed_errors = "An error occured: #{json_response}"
        fake_token = double("token", value: 'fake token 1234')
        stub_request(:get, "https://typekit.com/api/v1/json/kits").
          with(:headers => {
          'User-Agent'=>'Typhoeus - https://github.com/typhoeus/typhoeus',
          'X-Typekit-Token'=>/.*/}).
          to_return(:status => 401, :body => json_response, :headers => {})
        client = Typekitter::ApiClient.new
        allow(Typekitter::Token).to receive(:load).and_return(fake_token)

        response = client.kits_index

        expect(response).to eq(parsed_errors)
      end
    end
  end
end

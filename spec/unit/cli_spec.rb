require 'spec_helper'

describe Typekitter::CLI do
  include FakeFS::SpecHelpers

  describe 'display_token' do
    it 'displays the value of the saved token' do
      token = instance_double('Token', value: 'fake token 42')
      allow(Typekitter::Token).to receive(:load).and_return(token)
      allow(STDOUT).to receive(:puts).and_call_original
      cli = Typekitter::CLI.new

      cli.display_token

      expect(STDOUT).to have_received(:puts).with(
        "Your typekit token is: #{token.value}"
      )
    end
  end

  describe 'save_token' do
    it 'calls Token.setup with the given token value' do
      token_value = 'fake token 123'
      allow(Typekitter::Token).to receive(:setup).and_call_original
      cli = Typekitter::CLI.new

      cli.save_token(token_value)

      expect(cli.instance_variable_get(:@token).value).to eq(
        token_value
      )
      expect(Typekitter::Token).to have_received(:setup).with(token_value)
    end
  end
end

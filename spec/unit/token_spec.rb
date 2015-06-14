require 'spec_helper'

describe Typekitter::Token do
  include FakeFS::SpecHelpers

  describe '.save' do
    describe 'given a string representing the token\'s value' do
      it 'writes a file to the disk with the given value' do
        FakeFS.deactivate!
        byebug

        expected_token_value = 'my secret token 1234'
        Typekitter::Token.save(expected_token_value)

        expect(File.exists?(Typekitter::Token.token_path)).to eq(true)
        expect(File.open(Typekitter::Token.token_path).read).to eq(
          expected_token_value
        )
      end
    end
  end
end

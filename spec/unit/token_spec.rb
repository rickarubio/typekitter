require 'spec_helper'

describe Typekitter::Token do
  include FakeFS::SpecHelpers

  describe '.setup' do
    it 'calls .save and .load' do
      allow(Typekitter::Token).to receive(:save)
      allow(Typekitter::Token).to receive(:load)

      Typekitter::Token.setup('foo bar token')

      expect(Typekitter::Token).to have_received(:save)
      expect(Typekitter::Token).to have_received(:load)
    end
  end

  describe '.save' do
    context 'given a string representing the token\'s value' do
      it 'writes a file to the disk with the given value' do
        expected_token_value = 'my secret token 1234'

        Typekitter::Token.save(expected_token_value)

        expect(File.exists?(Typekitter::Token.token_path)).to eq(true)
        expect(File.open(Typekitter::Token.token_path).read).to eq(
          expected_token_value
        )
      end
    end
  end

  describe '.load' do
    context 'token file exists' do
      it 'reads the file, instantiates and returns a token' do
        expected_token_value = 'foo token 1234'

        Typekitter::Token.save(expected_token_value)
        token = Typekitter::Token.load

        expect(token.value).to eq(expected_token_value)
      end
    end
  end

  describe '.token_exists?' do
    context 'token file does not exist in the filesystem' do
      it 'returns false' do
        expect(Typekitter::Token.token_exists?).to eq(false)
      end
    end

    context 'a token file exists in the filesystem' do
      it 'returns true' do
        Typekitter::Token.save('foo bar token')

        expect(Typekitter::Token.token_exists?).to eq(true)
      end
    end
  end
end

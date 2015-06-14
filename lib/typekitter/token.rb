module Typekitter
  class Token
    DEFAULT_TOKEN_NAME = '.typekitter_token'

    def self.token_path
      "#{Dir.pwd}/#{DEFAULT_TOKEN_NAME}"
    end

    def self.save(value)
      File.open(token_path, 'w') do |file|
        file.write(value)
      end
    end
  end
end

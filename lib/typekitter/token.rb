module Typekitter
  class Token
    attr_reader :value

    DEFAULT_TOKEN_NAME = '.typekitter_token'

    def initialize(value)
      @value = value
    end

    def self.token_path
      "#{Dir.pwd}/#{DEFAULT_TOKEN_NAME}"
    end

    def self.save(value)
      File.open(token_path, 'w') do |file|
        file.write(value)
      end
    end

    def self.load
      if token_exists?
        value = File.open(token_path).read
        new value
      end
    end

    def self.token_exists?
      File.exists?(token_path)
    end
  end
end

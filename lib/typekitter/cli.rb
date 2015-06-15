class Typekitter::CLI < Thor
  attr_reader :client

  package_name 'typekitter'

  def initialize(*args)
    super
    @client = Typekitter::ApiClient.new
    @token = Typekitter::Token.load
  end

  desc 'save_token [value]', 'Saves the token to .typekitter-token'
  def save_token(value)
    @token = Typekitter::Token.setup(value)
    if @token
      puts "typekit token saved successfully"
    end
  end

  desc 'display_token', 'Displays the current token in use'
  def display_token
    puts "Your typekit token is: #{@token.value}"
  end

  desc 'kits_index', 'Display a list of all your typekits'
  def kits_index
    ap @client.kits_index, index: false
  end

  desc 'kits_create', 'Creates a new draft kit, returns kit info. See help for options'
  option :name, required: true
  option :domains
  option :families
  option :segmented_names
  def kits_create
    ap @client.kits_create(
      name: options[:name],
      domains: options[:domains],
      families: options[:families],
      segmented_names: options[:segmented_names]
    ), index: false
  end
end

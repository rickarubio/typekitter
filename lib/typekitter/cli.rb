class Typekitter::CLI < Thor
  package_name 'typekitter'
  @@token = nil

  desc 'save_token [value]', 'Saves the token to .typekitter-token'
  def save_token(value)
    @@token = Typekitter::Token.setup(value)
    if @@token
      puts "typekit token saved successfully"
    end
  end

  desc 'display_token', 'Displays the current token in use'
  def display_token
    @@token = Typekitter::Token.load
    puts "Your typekit token is: #{@@token.value}"
  end
end

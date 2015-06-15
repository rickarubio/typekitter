[![Code Climate](https://codeclimate.com/github/rickarubio/typekitter/badges/gpa.svg)](https://codeclimate.com/github/rickarubio/typekitter)
[![Test Coverage](https://codeclimate.com/github/rickarubio/typekitter/badges/coverage.svg)](https://codeclimate.com/github/rickarubio/typekitter/coverage)
[![Build Status](https://travis-ci.org/rickarubio/typekitter.svg?branch=master)](https://travis-ci.org/rickarubio/typekitter)

# Typekitter
Allows you to interact with typekit APIs with a ruby client

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'typekitter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install typekitter

## Usage
```
typekitter commands:
  typekitter display_token            # Displays the current token in use
  typekitter help [COMMAND]           # Describe available commands or one specific command
  typekitter kits_create --name=NAME  # Creates a new draft kit, returns kit info. See help for options
  typekitter kits_index               # Display a list of all your typekits
  typekitter save_token [value]       # Saves the token to .typekitter-token
```

Use the help command to get more information about commands:

```
Usage:
  typekitter kits_create --name=NAME

Options:
  --name=NAME
  [--domains=DOMAINS]
  [--families=FAMILIES]
  [--segmented-names=SEGMENTED_NAMES]

Creates a new draft kit, returns kit info. See help for options
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/typekitter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

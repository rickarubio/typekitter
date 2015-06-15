if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

require 'byebug'
require 'typekitter'
require 'fakefs/spec_helpers'
require 'webmock/rspec'
require 'json'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
$LOAD_PATH.unshift File.expand_path('../../bin', __FILE__)

RSpec.configure do |config|
  config.order = 'random'
end

WebMock.disable_net_connect!(allow_localhost: true, allow: 'codeclimate.com')

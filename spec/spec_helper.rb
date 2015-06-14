if ENV['CODECLIMATE_REPO_TOKEN']
  require 'codeclimate-test-reporter'
  CodeClimate::TestReporter.start
end

require 'byebug'
require 'typekitter'
require 'fakefs/spec_helpers'


$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

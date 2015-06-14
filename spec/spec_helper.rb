require 'codeclimate-test-reporter'
require 'byebug'
require 'typekitter'
require 'fakefs/spec_helpers'

CodeClimate::TestReporter.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

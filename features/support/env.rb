require 'cucumber'
require 'aruba/cucumber'
require 'byebug'

Before do
  @dirs.unshift File.expand_path('../../bin', __FILE__)
end

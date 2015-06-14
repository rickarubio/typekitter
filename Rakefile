require 'rspec/core/rake_task'
require 'bundler/gem_tasks'
require 'byebug'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color']
end

task :default => :spec

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'typekitter/version'

Gem::Specification.new do |spec|
  spec.name          = "typekitter"
  spec.version       = Typekitter::VERSION
  spec.authors       = ["Ricardo Rubio"]
  spec.email         = ["rickarubio@gmail.com"]

  spec.summary       = %q{Allows you to interact with typekit apis with a ruby client}
  spec.homepage      = "https://github.com/rickarubio/typekitter"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor"
  spec.add_runtime_dependency "typhoeus"
  spec.add_runtime_dependency "awesome_print"
  spec.add_runtime_dependency "webmock"
  spec.add_runtime_dependency "json"
  spec.add_development_dependency "aruba"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "fakefs"
  spec.add_development_dependency "cucumber"
end

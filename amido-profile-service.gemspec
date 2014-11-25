# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'profile-service/version'
require 'profile_service'

Gem::Specification.new do |spec|
  spec.name          = 'amido-profile-service'
  spec.version       = Amido::ProfileService::VERSION
  spec.authors       = ['Antony Koch']
  spec.email         = ['ant@iamkoch.com']
  spec.summary       = %q{Ruby Gem to access the Amido profile service}
  spec.homepage      = 'http://amido.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'

  spec.add_dependency 'httparty'
end

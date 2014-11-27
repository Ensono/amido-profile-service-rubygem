# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'amidoprofileservice/version'
require 'amidoprofileservice'

Gem::Specification.new do |spec|
  spec.name          = 'amidoprofileservice'
  spec.version       = Amido::ProfileService::VERSION
  spec.authors       = ['Antony Koch']
  spec.email         = ['ant@iamkoch.com']
  spec.summary       = %q{Ruby Gem to access the Amido profile service}
  spec.description   = %q{This gem allows subscribers to the amido profile service to consume the service in Ruby}
  spec.homepage      = 'http://amido.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec', '3.1.0'
  spec.add_development_dependency 'capybara', '2.4.4'
  spec.add_development_dependency 'simplecov'

  spec.add_dependency 'httparty', '0.11.0'
end

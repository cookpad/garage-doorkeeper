# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'garage/doorkeeper/version'

Gem::Specification.new do |spec|
  spec.name          = "garage-doorkeeper"
  spec.version       = Garage::Doorkeeper::VERSION
  spec.authors       = ["Taiki ONO"]
  spec.email         = ["taiki-ono@cookpad.com"]
  spec.summary       = %q{Garage extension to integrate doorkeeper gem.}
  spec.description   = spec.summary
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "doorkeeper", ">= 0.6.7", "< 1.5.0"
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

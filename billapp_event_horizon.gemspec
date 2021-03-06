# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'billapp_event_horizon/version'

Gem::Specification.new do |spec|
  spec.name          = "billapp_event_horizon"
  spec.version       = BillappEventHorizon::VERSION
  spec.authors       = ["tomaass"]
  spec.email         = ["tomas@sorejs.cz"]
  spec.summary       = %q{"Simple gem for logging events in Rails applications using Mongoid ODM created from  jzajpt's plugin."}
  spec.description   = %q{"Simple gem for logging events in Rails applications using Mongoid ODM created from  jzajpt's plugin."}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end

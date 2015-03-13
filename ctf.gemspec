# coding: utf-8
$LOAD_PATH.push File.expand_path('../lib', __FILE__)

require 'ctf/version'

Gem::Specification.new do |spec|
  spec.name          = "ctf"
  spec.version       = Ctf::VERSION
  spec.authors       = ["Ivan Bajalovic"]
  spec.email         = ["ivan@esseworks.cmo"]
  spec.summary       = %q{Compare Translation Files}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency('railties')
end

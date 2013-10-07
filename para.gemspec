# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'para/version'

Gem::Specification.new do |spec|
  spec.name          = "para-grids"
  spec.version       = Para::VERSION
  spec.authors       = ["Ian Thomas"]
  spec.email         = ["ian@ian-thomas.net"]
  spec.description   = %q{'para', from the greek 'beside' and the latin meaning 'alongside', is a grid system of great simplicity for use internally but available for the world.}
  spec.summary       = %q{A small grid framework that gets out of the way and lets the dev choose how they do things.}
  spec.homepage      = "http://www.github.com/finndigital/para"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

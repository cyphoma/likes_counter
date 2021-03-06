# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'likes_counter/version'

Gem::Specification.new do |spec|
  spec.name          = "likes_counter"
  spec.version       = LikesCounter::VERSION
  spec.authors       = ["Jonathan GEORGES", "Arnaud de Saint-Alary"]
  spec.email         = ["jonathan@cyphoma.com", "arnaud.dsa@gmail.com"]
  spec.summary       = %q{A likes counter for Facebook's pages}
  spec.description   = %q{}
  spec.homepage      = ""

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end

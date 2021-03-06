# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nhkanga/version'

Gem::Specification.new do |spec|
  spec.name          = "nhkanga"
  spec.version       = Nhkanga::VERSION
  spec.authors       = ["Casey Rosengren"]
  spec.email         = ["nocashvaluedrumz@gmail.com"]
  spec.description   = %q{Japanese news scraper}
  spec.summary       = %q{Scrapes text and kanji from various Japanese news sites}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "fakeweb", "~> 1.3"
  spec.add_dependency "nokogiri"
  spec.add_dependency "feedzirra"
end

# coding: utf-8
lib = File.expand_path('..', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rzman/version'

Gem::Specification.new do |spec|
  spec.name          = "rzman"
  spec.version       = Rzman::VERSION
  spec.authors       = ["Ben Greenberg"]
  spec.email         = ["bengreenberg@gmail.com"]

  spec.summary       = %q{A Ruby CLI gem to get halakhic zmanim.}
  spec.description   = %q{This CLI gem will get the halakhic zmanium for either today or for a date the user specifies and for any zipcode the user enters.}
  spec.homepage      = "http://www.github.com/benhayehudi/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "nokogiri"
  spec.add_dependency "mechanize"
  spec.add_dependency "colorize"

end

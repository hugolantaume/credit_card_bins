# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'credit_card_bins/version'

Gem::Specification.new do |spec|
  spec.name          = "credit_card_bins"
  spec.version       = CreditCardBins::VERSION
  spec.authors       = ["Hugo Lantaume"]
  spec.email         = ["hugolantaume@gmail.com"]
  spec.summary       = %q{Credit Card IIN/BIN lookup Ruby gem}
  spec.description   = %q{Find out how your customers are paying}
  spec.homepage      = "http://github.com/hugolantaume/credit_card_bins"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "coveralls"
end

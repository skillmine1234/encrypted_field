# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'encrypted_field/version'

Gem::Specification.new do |spec|
  spec.name          = "encrypted_field"
  spec.version       = EncryptedField::VERSION
  spec.authors       = ["akil"]
  spec.email         = ["kataria.subs@gmail.com"]

  spec.summary       = %q{client side encryption}
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.18"
  spec.add_development_dependency "rake", "~> 15.0"
  #spec.add_development_dependency "minitest", "~> 5.0"
end

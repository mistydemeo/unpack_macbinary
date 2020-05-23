# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unpack_macbinary/version'

Gem::Specification.new do |spec|
  spec.name          = "unpack_macbinary"
  spec.version       = MacBinary::VERSION
  spec.authors       = ["Misty De Meo"]
  spec.email         = ["mistydemeo@gmail.com"]
  spec.licenses      = ["kindest"]

  spec.summary       = %q{Tool to unpack MacBinary files into native Mac data/resource fork files.}
  spec.homepage      = "https://github.com/mistydemeo/unpack_macbinary"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.11"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_dependency "slop", "~> 4.2"
end

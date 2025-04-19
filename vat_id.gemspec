# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "vat_id"
  spec.version       = "0.0.3"
  spec.authors       = ["Kevin"]
  spec.email         = ["kevin.melchert@gmail.com"]
  spec.summary       = %q{VAT Identification Number validation}
  spec.description   = %q{VAT Identification Number data object and validator}
  spec.homepage      = "https://github.com/max-power/vat_id"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 3.2'
  
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 2.0"
  spec.add_development_dependency "tldr", "~> 1.0"
  spec.add_development_dependency "activemodel", "~> 7.0"
end

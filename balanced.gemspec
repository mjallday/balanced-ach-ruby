#!/usr/bin/env gem build
# -*- encoding: utf-8 -*-
require "base64"
require File.expand_path('../lib/balanced_ach/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Mahmoud Abdelkader"]
  gem.email         = ["bWFobW91ZEBwb3VuZHBheS5jb20="].map { |i| Base64.decode64(i) }
  gem.description   = %q{Balanced ACH experimental API}
  gem.summary       = %q{Sign up on https://balancedpayments.com/}
  gem.homepage      = "https://balancedpayments.com"

  gem.add_dependency("faraday", '~> 0.8')
  gem.add_dependency("faraday_middleware", '~> 0.8.7')

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "balanced-ach"
  gem.require_paths = %w(lib)
  gem.version       = Balanced::VERSION
end
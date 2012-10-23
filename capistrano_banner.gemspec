# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano_banner/version'

Gem::Specification.new do |gem|
  gem.name          = "capistrano_banner"
  gem.version       = CapistranoBanner::VERSION
  gem.authors       = ["HORII Keima"]
  gem.email         = ["holysugar@gmail.com"]
  gem.description   = %q{capistrano application banner}
  gem.summary       = %q{provids banner method to display application banner}
  gem.homepage      = "https://github.com/holysugar/capistrano_banner"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'capistrano'
  gem.add_dependency 'term-ansicolor'
end

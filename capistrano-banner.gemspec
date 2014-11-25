# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano-banner/version'

Gem::Specification.new do |gem|
  gem.name          = "capistrano-banner"
  gem.version       = CapistranoBanner::VERSION
  gem.authors       = ["HORII Keima", "KONDO Uchio"]
  gem.email         = ["holysugar@gmail.com", "udzura@udzura.jp"]
  gem.description   = %q{capistrano application banner}
  gem.summary       = %q{provides a task to display application banner}
  gem.homepage      = "https://github.com/holysugar/capistrano-banner"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'capistrano', '>= 3.0.0'
  gem.add_runtime_dependency 'term-ansicolor'
  gem.add_runtime_dependency 'highline'
end

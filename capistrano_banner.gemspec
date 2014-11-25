# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano_banner/version'

Gem::Specification.new do |gem|
  gem.name          = "capistrano_banner"
  gem.version       = CapistranoBanner::VERSION
  gem.authors       = ["HORII Keima", "KONDO Uchio"]
  gem.email         = ["holysugar@gmail.com", "udzura@udzura.jp"]
  gem.description   = %q{capistrano application banner}
  gem.summary       = %q{provides a task to display application banner}
  gem.homepage      = "https://github.com/holysugar/capistrano_banner"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  spec.post_install_message = <<MESSAGE
Gem name `capistrano_banner' is deprecated for Capistrano 3
and we have installed new `capistrano-banner' gem.
Please switch your Gemfile to

    \e[32mgem \e[1;35m"capistrano-banner"\e[0m

Thank you for using this gem!
MESSAGE

  gem.add_runtime_dependency 'capistrano-banner'
end

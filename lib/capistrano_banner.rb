require "capistrano_banner/version"
require "capistrano_banner/base"

Capistrano::Configuration.send(:include, CapistranoBanner::IntegrationMethods)

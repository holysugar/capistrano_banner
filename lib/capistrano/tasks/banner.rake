require 'capistrano_banner/base'

namespace :deploy do
  desc 'Show banner of service'
  task :banner do
    path  = fetch(:banner_path, "./config/banner.txt")
    stage = fetch(:stage, :development)
    options = fetch(:banner_options, {})

    CapistranoBanner::Base.new(stage, path).print_banner(options)
  end

  before :starting, :banner
end

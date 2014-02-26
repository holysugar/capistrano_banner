require 'term/ansicolor'
require 'highline'

module CapistranoBanner
  class Base
    def initialize(stage, path)
      @stage = stage
      @path = path
      @ui = HighLine.new
    end

    def banner
      File.read(@path)
    end

    def color_banner(color)
      Term::ANSIColor.send(color, Term::ANSIColor.bold(banner))
    end

    def pause
      exit unless @ui.agree(prompt)
    end

    def prompt
      "This is #{Term::ANSIColor.send(color, @stage.to_s)} stage. Are you ready? (y/N) >"
    end

    def color(overwrite = nil)
      return overwrite if overwrite

      case @stage
      when :production ; :red
      when :staging    ; :yellow
      else :green      ; :green
      end
    end

    def warning_color?(color)
      color == :red
    end

    def print_banner(options)
      c = color(options[:color])
      puts color_banner(c)

      if !options[:force] && (warning_color?(c) || options[:pause])
        pause
      end
    end
  end

  module IntegrationMethods
    def banner(options = {})
      path = self[:banner_path] || "./config/banner.txt"
      env  = self[:rack_env] || self[:rails_env] || (raise "rails_env or rack_env is required.") # FIXME: or anything else?

      Base.new(env, path).print_banner(options)
    end
  end
end

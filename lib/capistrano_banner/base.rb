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
      if @path.end_with? ".erb"
        require 'erb'
        template = File.read(@path)
        ERB.new(template).result
      else
        File.read(@path)
      end
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

  def self.banner(banner_path = nil, stage = fetch(:stage), options = {})
    banner_path ||= (
      File.exist?("./config/banner.txt.erb") ? "./config/banner.txt.erb" : "./config/banner.txt"
    )
    Base.new(stage, banner_path).print_banner(options)
  end
end

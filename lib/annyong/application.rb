require 'ostruct'

module Annyong

  class Application

    def server
      @server ||= Rack::Server.new({
        :config      => File.join(File.dirname(__FILE__), "../../assets/rack/config.ru"),
        :Port        => port,
        :Host        => host,
        :AccessLog   => [],
      })
    end

    def run
      server.start
    end

    def port
      options[:port]
    end

    def host
      options[:host]
    end

    def initialize(args)
      @options = parse_options(args)
    end

    def options
      @options ||= parse_options
    end

    private

    def parse_options(args)
      options = {
        :port => 9292,
        :host => "0.0.0.0"
      }

      option_parser = OptionParser.new do |opts|
        opts.banner = "Usage: annyong [options]"
        opts.separator ""
        opts.separator "Options:"

        opts.on("--port [PORT]", "The port to use (default: #{options[:port]})") do |port|
          options[:port] = port
        end
        opts.on("--host [HOST]", "The host to listen on (default: #{options[:host]})") do |host|
          options[:host] = host
        end

        #opts.on("--path [PATH]", "The directory to serve") do |path|
        #options[:path] = path
        #end
      end

      option_parser.parse!(args)
      options
    end

  end
end

module Annyong
  class Middleware

    attr_reader :styles

    def initialize(app) # {{{
      @app = app
      @styles = File.read(File.join(File.dirname(__FILE__), "../../assets/css/annyong.css"))
    end # }}}

    def inject(body) # {{{
      body = body.sub(/<html>/, "<!doctype html>\n<html>")
      body = body.sub(/<\/head>/, "<style type='text/css'>#{@styles}</style>")
      body = body.sub(/<\/body>/, "<footer><code>#{`pwd`.chomp}</code>, <a target='_blank' title='Powered by annyong' href='https://github.com/remiprev/annyong'>annyong</a>!</footer></body")
      body
    end # }}}

    def call(env) # {{{
      status, headers, response = @app.call(env)

      response_body = ""
      response.each { |part| response_body += part }
      response_body = inject(response_body)

      headers["Content-Length"] = response_body.length.to_s

      [status, headers, response_body]
    end # }}}

  end
end

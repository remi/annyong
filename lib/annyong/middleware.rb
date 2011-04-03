module Annyong
  class Middleware

    def initialize(app) # {{{
      @app = app
    end # }}}

    def call(env) # {{{
      status, headers, response = @app.call(env)

      styles = File.read(File.join(File.dirname(__FILE__), "../../assets/css/annyong.css"))
      response_body = ""
      response.each { |part| response_body += part }
      response_body = response_body.sub(/<\/head>/, "<style type='text/css'>#{styles}</style>")

      headers["Content-Length"] = response_body.length.to_s

      [status, headers, response_body]
    end # }}}

  end
end

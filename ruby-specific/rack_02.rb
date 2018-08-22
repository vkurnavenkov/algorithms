require "rack"
require "thin"

app = -> (env) do
  sleep 3
  [ 200, { "Content-Type" => "text/plain" }, ["Hello World\n"] ]
end

class LoggingMiddleware
  def initialize(app)
    @app = app
  end

  def call(env)
    before = Time.now.to_i
    status, headers, body = @app.call(env)
    after = Time.now.to_i
    log_message = "App took #{after - before} seconds."

    [status, headers, body << log_message]
  end
end

Rack::Handler::Thin.run LoggingMiddleware.new(app)

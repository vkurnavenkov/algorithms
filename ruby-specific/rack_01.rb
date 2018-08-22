require "rack"
require "thin"

app = -> (env) do
  [ 200, { "Content-Type" => "text/plain" }, env ]
end

Rack::Handler::Thin.run app

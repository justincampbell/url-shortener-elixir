defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    conn.fetch([:params])
  end

  get "/" do
    redirect conn, to: "https://github.com/justincampbell/url-shorteners"
  end
end

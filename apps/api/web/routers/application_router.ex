defmodule ApplicationRouter do
  use Dynamo.Router

  prepare do
    conn.fetch([:params])
  end

  get "/" do
    redirect conn, to: "https://github.com/justincampbell/url-shorteners"
  end

  get "/shorten" do
    token = Shortener.Core.shorten(conn.params[:url])
    conn.resp 201, "/#{token}"
  end

  get "/:token" do
    url = Shortener.Core.expand(conn.params[:token])

    case url do
      nil -> conn.send 404, "Not found"
      _ -> redirect conn, to: url
    end
  end
end

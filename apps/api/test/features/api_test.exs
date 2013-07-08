Code.require_file "../../test_helper.exs", __FILE__

defmodule ApiTest do
  use Api.TestCase
  use Dynamo.HTTP.Case

  @url "http://example.com"

  test "root redirects to documentation" do
    conn = get("/")

    assert conn.status == 302
    assert conn.resp_headers["location"] ==
      "https://github.com/justincampbell/url-shorteners"
  end

  test "shortening a url" do
    conn = get("/shorten?url=#{@url}")

    assert conn.status == 201

    [ _, token ] = String.split(conn.sent_body, "/")

    assert String.starts_with?(conn.sent_body, "/")
    assert Shortener.Core.expand(token) == @url
  end

  test "redirecting with a token" do
    token = Shortener.Core.shorten(@url)

    conn = get("/#{token}")

    assert conn.status == 302
    assert conn.resp_headers["location"] == @url
  end

  test "redirecting with a nonexistent token" do
    conn = get("/herpderp")

    assert conn.status == 404
  end
end

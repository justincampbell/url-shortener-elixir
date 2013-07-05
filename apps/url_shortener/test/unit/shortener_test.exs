Code.require_file "../../test_helper.exs", __FILE__

defmodule ShortenerTest do
  use UrlShortener.TestCase

  alias UrlShortener.Shortener
  doctest Shortener

  @url "http://example.com"

  test "shorten and expand url" do
    state = Shortener.State.new

    {state, token} = Shortener.shorten(state, @url)

    assert token != @url
    assert is_bitstring(token)

    url = Shortener.expand(state, token)

    assert url == @url
  end
end

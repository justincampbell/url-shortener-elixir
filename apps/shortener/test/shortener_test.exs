Code.require_file "../test_helper.exs", __FILE__

defmodule ShortenerTest do
  use ExUnit.Case, async: true

  alias Shortener.Core, as: Shortener
  doctest Shortener

  @url "http://example.com"

  test "shorten and expand url" do
    token = Shortener.shorten(@url)

    assert token != @url
    assert is_bitstring(token)

    url = Shortener.expand(token)

    assert url == @url
  end
end

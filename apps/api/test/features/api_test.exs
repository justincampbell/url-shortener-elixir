Code.require_file "../../test_helper.exs", __FILE__

defmodule ApiTest do
  use Api.TestCase
  use Dynamo.HTTP.Case

  test "root redirects to documentation" do
    conn = get("/")

    assert conn.status == 302
    assert conn.resp_headers["location"] ==
      "https://github.com/justincampbell/url-shorteners"
  end
end

Dynamo.under_test(UrlShortener.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule UrlShortener.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end

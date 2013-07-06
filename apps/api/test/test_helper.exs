Dynamo.under_test(Api.Dynamo)
Dynamo.Loader.enable
ExUnit.start

defmodule Api.TestCase do
  use ExUnit.CaseTemplate

  # Enable code reloading on test cases
  setup do
    Dynamo.Loader.enable
    :ok
  end
end

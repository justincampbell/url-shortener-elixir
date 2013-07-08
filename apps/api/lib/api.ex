defmodule Api do
  use Application.Behaviour

  @doc """
  The application callback used to start this
  application and its Dynamos.
  """
  def start(_type, _args) do
    Api.Dynamo.start_link([max_restarts: 5, max_seconds: 5])
    Shortener.start_link([max_restarts: 5, max_seconds: 5])
  end
end

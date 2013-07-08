defmodule Shortener do
  use Application.Behaviour

  def start(_type, _args) do
    Shortener.Core.start_link([max_restarts: 5, max_seconds: 5])
  end
end

defmodule UrlShortener.Shortener do
  use GenServer.Behaviour

  defrecord State, id: 0, urls: HashDict.new

  def init(args) do
    {:ok, State.new}
  end

  def handle_call({ :shorten, url }, from, state) do
    {state, token} = shorten(state, url)
    {:reply, token, state}
  end

  def handle_call({ :expand, token }, from, state) do
    url = expand(state, token)
    {:reply, url, state}
  end

  def handle_call(request, from, state) do
    super(request, from, state)
  end

  def shorten(state, url) do
    id = state.id + 1
    token = tokenize(id)
    urls = Dict.put(state.urls, token, url)
    state = State[id: id, urls: urls]

    {state, token}
  end

  def expand(state, token) do
    state.urls[token]
  end

  defp tokenize(id) do
    "#{id}"
  end
end

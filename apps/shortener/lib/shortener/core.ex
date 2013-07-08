defmodule Shortener.Core do
  use GenServer.Behaviour

  defrecord State, id: 0, urls: HashDict.new

  def init(args) do
    {:ok, State.new}
  end

  def start_link(env) do
    :gen_server.start_link({ :local, __MODULE__ }, __MODULE__, env, [])
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

  def shorten(url) do
    :gen_server.call(__MODULE__, { :shorten, url })
  end

  def expand(token) do
    :gen_server.call(__MODULE__, { :expand, token })
  end

  defp shorten(state, url) do
    id = state.id + 1
    token = tokenize(id)
    urls = Dict.put(state.urls, token, url)
    state = State[id: id, urls: urls]

    {state, token}
  end

  defp expand(state, token) do
    state.urls[token]
  end

  defp tokenize(id) do
    "#{id}"
  end
end

defmodule UrlShortener.Mixfile do
  use Mix.Project

  def project do
    [ app: :url_shortener,
      version: "0.0.1",
      dynamos: [UrlShortener.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/url_shortener/ebin",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo],
      mod: { UrlShortener, [] } ]
  end

  defp deps do
    [ { :cowboy, %r(.*), github: "extend/cowboy" },
      { :dynamo, "0.1.0.dev", github: "elixir-lang/dynamo" } ]
  end
end

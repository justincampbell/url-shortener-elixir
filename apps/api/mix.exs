defmodule Api.Mixfile do
  use Mix.Project

  def project do
    [ app: :api,
      version: "0.0.1",
      dynamos: [Api.Dynamo],
      compilers: [:elixir, :dynamo, :app],
      env: [prod: [compile_path: "ebin"]],
      compile_path: "tmp/#{Mix.env}/api/ebin",
      deps: deps ]
  end

  # Configuration for the OTP application
  def application do
    [ applications: [:cowboy, :dynamo, :shortener],
      mod: { Api, [] } ]
  end

  defp deps do
    [ { :cowboy, %r(.*), github: "extend/cowboy" },
      { :dynamo, "0.1.0.dev", github: "elixir-lang/dynamo" },
      { :shortener, path: "../shortener" } ]
  end
end

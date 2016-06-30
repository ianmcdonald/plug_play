defmodule PlugPlay.Mixfile do
  use Mix.Project

  def project do
    [app: :plug_play,
     version: "0.0.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:cowboy, :logger, :plug],
     mod: {PlugPlay, []},
     env: [cowboy_port: 8080]]
  end

  defp deps do
    [{:cowboy, "~> 1.0.0"},
     {:plug, "~> 1.0"}]
  end
end

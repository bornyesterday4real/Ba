defmodule Ba.MixProject do
  use Mix.Project

  def project do
    [
      app: :ba,
      version: "2.0.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Ba.Application, []}
    ]
  end

  defp deps do
    [
      {:nostrum, git: "https://github.com/Kraigie/nostrum.git"}
    ]
  end
end

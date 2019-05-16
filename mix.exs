defmodule Card.MixProject do
  use Mix.Project

  def project do
    [
      app: :card_bin_ex,
      version: "1.0.0",
      elixir: "~> 1.7",
      compilers: [:gettext] ++ Mix.compilers,
      deps: deps(),
      test_coverage: [tool: ExCoveralls]
    ]
  end

  def application do
    [
      extra_applications: [
        :logger
      ]
    ]
  end

  defp deps do
    [
      {:gettext, "~> 0.16"},
      {:excoveralls, "~> 0.10.1", only: :test},
      {:credo, "~> 0.9.3", only: [:dev, :test], runtime: false}
    ]
  end
end

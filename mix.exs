defmodule Card.MixProject do
  use Mix.Project

  def project do
    [
      app: :card_bin_ex,
      version: "1.0.0",
      elixir: "~> 1.7",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [
        tool: ExCoveralls
      ],
      description: description(),
      package: package()
    ]
  end

  defp description do
    """
    Module to discover the CreditCard brand based in the first digits
    """
  end

  defp package do
    [
      files: [
        "lib",
        "priv",
        ".formatter.exs",
        "mix.exs",
        "README*",
        "LICENSE*"
      ],
      maintainers: [
        "Ingresse",
        "Vitor Leal"
      ],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/ingresse/card-bin-ex"
      }
    ]
  end

  def application do
    [
      extra_applications: [:logger]
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

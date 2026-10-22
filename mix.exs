defmodule Interactor.Mixfile do
  use Mix.Project

  def project do
    [
      app: :interactor,
      version: "0.1.0",
      elixir: "~> 1.16",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      source_url: "https://github.com/AgilionApps/interactor",
      package: package(),
      description: description(),
      deps: deps()
    ]
  end

  def application do
    # Added with elixir 1.15 due to code path issues with ecto being an optional dependency but required for testing
    extra_applications = if Mix.env() == :test, do: [:ecto], else: []
    [applications: [:logger] ++ extra_applications, mod: {Interactor.Application, []}]
  end

  defp deps do
    [
      # Flow is limiting this to 3.7.2
      {:ecto, ">= 3.7.2", optional: true},
      {:ex_doc, "~> 0.40.0", only: :dev},
      {:sobelow, "~> 0.16", only: [:dev, :test], runtime: false, warn_if_outdated: true}
    ]
  end

  defp package do
    [
      licenses: ["Apache 2.0"],
      maintainers: ["Alan Peabody"],
      links: %{
        "GitHub" => "https://github.com/AgilionApps/interactor"
      }
    ]
  end

  defp description do
    """
    Interactor provides an opinionated interface for performing complex user
    interactions.
    """
  end
end

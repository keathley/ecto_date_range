defmodule EctoDateRange.Mixfile do
  use Mix.Project

  def project do
    [app: :ecto_date_range,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     deps: deps]
  end

  def application do
    [applications: [:logger, :ecto, :postgrex],
     mod: {EctoDateRange, []}]
  end

  defp deps do
    [{:ecto, "~> 2.0"},
      {:postgrex, "~> 0.11"}]
  end

  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate"],
    "test": ["ecto.create --quiet", "ecto.migrate", "test"],
     "ecto.reset": ["ecto.drop", "ecto.setup"]]
  end
end

use Mix.Config

config :ecto_date_range, ecto_repos: [EctoDateRange.Repo]

config :ecto_date_range, EctoDateRange.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "ecto_date_range_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

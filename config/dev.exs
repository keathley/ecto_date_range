use Mix.Config

config :ecto_date_range, EctoDateRange.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "ecto_date_range_development",
  hostname: "localhost",
  pool_size: 10

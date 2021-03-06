defmodule EctoDateRange do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(EctoDateRange.Repo, []),
    ]

    opts = [strategy: :one_for_one, name: EctoDateRange.Supervisor]
    Supervisor.start_link(children, opts)
  end
end

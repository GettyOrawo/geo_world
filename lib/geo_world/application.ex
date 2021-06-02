defmodule GeoWorld.Application do
  def start(_type, _args) do
    children = [
      GeoWorld.Repo
    ]

    opts = [strategy: :one_for_one, name: GeoWorld.Supervisor]

    Supervisor.start_link(children, opts)
  end
end

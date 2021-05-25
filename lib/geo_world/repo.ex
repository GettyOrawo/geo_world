defmodule GeoWorld.Repo do
  use Ecto.Repo,
    otp_app: :geo_world,
    adapter: Ecto.Adapters.Postgres
end

import Config

config :geo_world, GeoWorld.Repo,
  database: "geo_world_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :geo_world,
      ecto_repos: [GeoWorld.Repo]

# GeoWorld

**Welcome to GeoWorld library, this library enables you to decode csv records and persist it in your prefered database**

## Installation

Add it as a dependency to your project, do this on the `mix.exs` file:


```elixir
defp deps do
  [
    {:geo_world, git: "https://github.com/GettyOrawo/geo_world.git"},
  ]
end
```
You can now include your csv file at the root of the project. Kindly note that `geo_world` works with a comma separated csv format.
Once you've done all this, open your mix console:


```elixir
iex -S mix
```

and run the import function located on `geo_world.ex` passing your csv file name as a parameter:

To be able to use this dependancy we need to install it by running the following command from your project root:

```elixir
mix deps.get
end
```

You can now include your csv file at the root of the project. Kindly note that `geo_world` works with a comma separated csv format.
Once you've done all this, open your mix console:


```elixir
iex -S mix
```

and run the import function located on `geo_world.ex` passing your csv file name as a parameter:

```elixir
GeoWorld.import_csv(file_name)
```

You're all set ! :)

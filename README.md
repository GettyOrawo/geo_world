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

-> on the mix console:

```elixir
GeoWorld.import_csv(file_name)
```

**Expected output:** You will receive some analytics about your import including time_elapsed, accepted, rejected and total records:

```elixir
%{accepted: 1, rejected: 1, time_elapsed_in_microsecs: 460719, total_records: 2}
```
-> on your terminal:

```bash
curl --location --request GET 'http://localhost:4000/geolocation/167.140' --header 'Content-Type: application/json'
```

**Expected output:** 

- if the IP address exists in the database

You will receive some not-so-pretty json with details on the ip address you reuested **only if it exists** with a status code 200:

```json
{"mystery_value":"7301823115","longitude":"-37.62435199624531","latitude":"-68.31023296602508","ip_address":"160.103.7.140","id":1,"country_code":"CZ","country":"Nicaragua","city":"New Neva","__meta__":{"state":"loaded","source":"geolocations","schema":"Elixir.GeoWorld.Geolocation","prefix":null,"context":null}}
```

- if the IP address does **NOT** exist in the database:
You will receive the below response with a status code 400:

```json
{"text":"The IP Address you seek does not exist","status":"NOT FOUND!"}
```
You're all set ! :)

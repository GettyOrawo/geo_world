defmodule GeoWorld.Geolocation do
  use Ecto.Schema
  import Ecto.Changeset
  alias GeoWorld.Repo

  schema "geolocations" do
  	field :ip_address
	field :country_code
	field :country
	field :city
	field :latitude
	field :longitude
	field :mystery_value
  end

  def changeset(geolocation, params \\ %{}) do
  	geolocation
  	|> cast(params, [:ip_address, :country_code, :country, :city, :latitude, :longitude, :mystery_value])
  	|> validate_required([:ip_address, :country_code, :country, :city, :latitude, :longitude, :mystery_value])
  	|> unsafe_validate_unique([:country, :city], Repo, message: "City must be unique within Country")
  	|> unique_constraint([:ip_address, :mystery_value])
  end

end
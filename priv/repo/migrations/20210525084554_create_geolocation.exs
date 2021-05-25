defmodule GeoWorld.Repo.Migrations.CreateGeolocation do
  use Ecto.Migration

  def change do
  	create table(:geolocations) do
  		add :ip_address, :string
  		add :country_code, :string
  		add :country, :string
  		add :city, :string
  		add :latitude, :string
  		add :longitude, :string
  		add :mystery_value, :string
  	end

  	create unique_index(:geolocations, [:ip_address, :mystery_value])
  end
end

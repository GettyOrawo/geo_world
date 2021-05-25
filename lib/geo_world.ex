defmodule GeoWorld do
  @moduledoc """
  A module for geolocation information
  """

  @doc """
  Takes input from CSV file and decodes each line into a map as a record
  """

  def decode_csv do
    "data_dump.csv"
    |> File.stream!
    |> CSV.decode(separator: ?,, headers: true)
    |> Enum.take(10) #only for the first 10 records
    |> Keyword.get_values(:ok)
  end
end

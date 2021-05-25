defmodule GeoWorld do
  @moduledoc """
  A module for geolocation information
  """
  alias GeoWorld.Geolocation
  alias GeoWorld.Repo

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


  def persist_record([], accepted, rejected, {current, total}) do
    %{accepted: accepted, rejected: rejected, total_records: total}
  end

  def persist_record(data, accepted, rejected, {current, total}) do   
    [params | rem] = data 
    changeset = Geolocation.changeset(%Geolocation{}, params)
    case Repo.insert(changeset) do
      {:ok, geolocation} -> 
        persist_record(rem, accepted+1, rejected, {current + 1, total})
      {:error, changeset} -> 
        persist_record(rem, accepted, rejected+1, {current + 1, total})
    end
  end

  def import_csv do
    data = decode_csv()
    {time_in_micro, res} = :timer.tc(fn -> persist_record(data, 0 ,0 , {0, Enum.count(data)}) end)
  end
end

defmodule GeoWorld do
  @moduledoc """
  A module for geolocation information it fetches records from a csv file(comma separated) & persists it to a database
  """
  alias GeoWorld.Geolocation
  alias GeoWorld.Repo

  @doc """
  Takes input from CSV file and decodes each line into a map as a record
  """

  def decode_csv do
    "data_dump_test.csv"
    |> File.stream!()
    |> CSV.decode(separator: ?,, headers: true)
    # only for the first 10 records
    |> Enum.to_list
    |> Keyword.get_values(:ok)
  end

  @doc """
  Persists each record from csv and returns statistics of accepted & rejected records
  """

  def persist_record([], accepted, rejected, {current, total}) do
    %{accepted: accepted, rejected: rejected, total_records: total}
  end

  def persist_record(data, accepted, rejected, {current, total}) do
    [params | rem] = data
    changeset = Geolocation.changeset(%Geolocation{}, params)

    case Repo.insert(changeset) do
      {:ok, geolocation} ->
        persist_record(rem, accepted + 1, rejected, {current + 1, total})

      {:error, changeset} ->
        persist_record(rem, accepted, rejected + 1, {current + 1, total})
    end
  end

  @doc """
  imports csv records and persists them on the database
  """

  def import_csv do
    {time_in_micro, res} =
      :timer.tc(fn ->
        data = decode_csv()
        persist_record(data, 0, 0, {0, Enum.count(data)})
      end)

    Enum.into(%{time_elapsed_in_microsecs: time_in_micro}, res)
  end

  @doc """
  fetches a single location's details based on the provided ip_address
  """

  def get_geolocation_data(ip_address) do
    Geolocation |> Repo.get_by(ip_address: ip_address)
  end
end

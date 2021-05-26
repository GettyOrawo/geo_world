defmodule GeoWorld.Router do
  use Plug.Router

  plug(:match)
  plug(:dispatch)

  get "/" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Poison.encode!(message(conn)))
  end

  defp message(conn) do
    %{"ip_address" => ip_address} = conn.params
    case res = GeoWorld.get_geolocation_data(ip_address) do
      nil -> 
        %{
          status: "NOT FOUND!",
          text: "The IP Address you seek does not exist"
        }
      _ -> res
    end
    
  end
end
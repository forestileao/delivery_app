defmodule DeliveryApp.PostalCode.DataParser do
  @postal_codes_path Path.join(:code.priv_dir(:delivery_app), "2022_Gaz_zcta_national.txt")

  def parse_data do
    [_header | data_rows] = File.read!(@postal_codes_path) |> String.split("\n")

    data_rows
    |> Stream.map(&String.split(&1, "\t"))
    |> Stream.filter(&(Enum.count(&1) == 7))
    |> Stream.map(&format_row(&1))
    |> Enum.into(%{})
  end

  defp parse_number(numeric_str) do
    numeric_str |> String.trim() |> String.to_float()
  end

  defp format_row([postal_code, _, _, _, _, latitude, longitude]) do
    latitude = parse_number(latitude)
    longitude = parse_number(longitude)

    {postal_code, {latitude, longitude}}
  end
end

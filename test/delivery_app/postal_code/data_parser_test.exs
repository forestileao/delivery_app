defmodule DeliveryApp.PostalCode.DataParserTest do
  use ExUnit.Case
  alias DeliveryApp.PostalCode.DataParser
  doctest DeliveryApp

  describe "parse_data/0" do
    test "If the postal code file exists, parse the data" do
      data_rows = DataParser.parse_data()

      {_, {latitude, longitude}} = Enum.at(data_rows, 0)

      assert is_float(latitude)
      assert is_float(longitude)
    end
  end
end

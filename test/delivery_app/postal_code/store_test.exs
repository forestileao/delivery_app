defmodule DeliveryApp.PostalCode.StoreTest do
  use ExUnit.Case
  alias DeliveryApp.PostalCode.Store
  doctest DeliveryApp

  describe "get_geolocation/1" do
    test "if the postal code has been found, returns its latitude and longitude" do
      {latitude, longitude} = Store.get_geolocation("94062")

      assert is_float(latitude)
      assert is_float(longitude)
    end
  end
end

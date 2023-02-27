defmodule DeliveryApp.PostalCode.CacheTest do
  use ExUnit.Case
  alias DeliveryApp.PostalCode.Cache
  doctest DeliveryApp

  test "get_distance/2 and set_distance/3" do
    p1 = "12345"
    p2 = "93422"
    distance = 88.23

    Cache.set_distance(p1, p2, distance)

    cached_distance = Cache.get_distance(p1, p2)

    assert cached_distance == distance
  end
end

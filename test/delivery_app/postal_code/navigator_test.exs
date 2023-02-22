defmodule DeliveryApp.PostalCode.NavigatorTest do
  use ExUnit.Case
  alias DeliveryApp.PostalCode.Navigator
  doctest DeliveryApp

  describe "get_distance/2" do
    test "It should get the distance between two postal codes (postal code strings)" do
      distance = Navigator.get_distance("94062", "94104")

      assert is_float(distance)
    end

    test "It should get the distance between two postal codes (postal code integers)" do
      distance = Navigator.get_distance(94062, 94104)

      assert is_float(distance)
    end

    test "It should get the distance between two postal codes (postal code integer and string)" do
      distance = Navigator.get_distance(94062, "94104")

      assert is_float(distance)
    end

    test "It should get the distance between two postal codes (postal code string and integer)" do
      distance = Navigator.get_distance("94062", 94104)

      assert is_float(distance)
    end

    @tag :capture_log
    test "It should raise ArgumentError due to an unexpected format" do
      navigator_pid = Process.whereis(:postal_code_navigator)
      reference = Process.monitor(navigator_pid)

      catch_exit do
        Navigator.get_distance("94062", 94104.312)
      end

      assert_received({:DOWN, ^reference, :process, ^navigator_pid, {%ArgumentError{}, _}})
    end
  end

  describe "get_distance/2 - actual distance" do
    test "Distance between Redwood City and San Francisco ~ 64 km" do
      distance = Navigator.get_distance("94062", "94104")

      assert distance == 42.32
    end

    test "Distance between San Francisco and New York ~ 4988 miles" do
      distance = Navigator.get_distance("94104", "10112")

      assert distance == 4132.75
    end
  end
end

defmodule GeoWorldTest do
  use ExUnit.Case
  doctest GeoWorld

  test "greets the world" do
    assert GeoWorld.hello() == :world
  end
end

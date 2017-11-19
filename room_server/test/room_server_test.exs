defmodule RoomServerTest do
  use ExUnit.Case
  doctest RoomServer

  test "greets the world" do
    assert RoomServer.hello() == :world
  end
end

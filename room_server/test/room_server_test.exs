defmodule RoomServerTest do
  use ExUnit.Case
  doctest RoomServer

  # test "greets the world" do
  #   assert RoomServer.hello() == :world
  # end

  test "Makes correct Checkerboard" do

    RoomServer.new_room("Austin's Room", :Checkers, "SuperSecret")
    
    my_room = RoomServer.find("Austin's Room")

    good_state = %{
        "00" => :blue,
        "01" => :blue,
        "02" => :blue,
        "03" => :blue,
        "10" => :blue,
        "11" => :blue,
        "12" => :blue,
        "13" => :blue,
        "20" => :blue,
        "21" => :blue,
        "22" => :blue,
        "23" => :blue,

        "30" => :empty,
        "31" => :empty,
        "32" => :empty,
        "33" => :empty,
        "40" => :empty,
        "41" => :empty,
        "42" => :empty,
        "43" => :empty,

        "50" => :pink,
        "51" => :pink,
        "52" => :pink,
        "53" => :pink,
        "60" => :pink,
        "61" => :pink,
        "62" => :pink,
        "63" => :pink,
        "70" => :pink,
        "71" => :pink,
        "72" => :pink,
        "73" => :pink
    }

    assert my_room.board_state ==  %{"Austin's Room" => good_state}
  end
end

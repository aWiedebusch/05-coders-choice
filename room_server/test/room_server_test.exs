defmodule RoomServerTest do
  use ExUnit.Case
  doctest RoomServer

####################################################
#               !!!!IMPORTANT!!!                   #
#           These Tests were designed to           #
#               be run one at a time               #
####################################################

  @tag construction: true

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

  @tag blue_down: true

  test "Blue Moves Down" do

    RoomServer.new_room("Austin's Room", :Checkers, "SuperSecret")

    my_room = RoomServer.find("Austin's Room")
    { :ok, my_board } = Map.fetch(my_room.board_state, "Austin's Room")

    good_state = Map.replace(my_board, "23", :empty)
    good_state = Map.replace(good_state, "33", :blue)

    { _status, new_state } = RoomServer.make_move("Austin's Room", "23", "33", :blue)


    # assert RoomServer.find("Austin's Room") == false
    assert good_state == new_state
  end

  @tag blue_up: true

    test "Blue Doesn't Move Up" do

    RoomServer.new_room("Austin's Room", :Checkers, "SuperSecret")

    my_room = RoomServer.find("Austin's Room")
    { :ok, my_board } = Map.fetch(my_room.board_state, "Austin's Room")

    good_state = Map.replace(my_board, "23", :empty)
    good_state = Map.replace(good_state, "33", :blue)

    RoomServer.make_move("Austin's Room", "23", "33", :blue)
    { _status, new_state } = RoomServer.make_move("Austin's Room", "33", "23", :blue)

    assert good_state == new_state
  end

  @tag pink_up: true

    test "Pink Moves Up" do

    RoomServer.new_room("Austin's Room", :Checkers, "SuperSecret")

    my_room = RoomServer.find("Austin's Room")
    { :ok, my_board } = Map.fetch(my_room.board_state, "Austin's Room")

    good_state = Map.replace(my_board, "53", :empty)
    good_state = Map.replace(good_state, "43", :pink)

    { _status, new_state } = RoomServer.make_move("Austin's Room", "53", "43", :pink)

    assert good_state == new_state
  end

  @tag pink_down: true

    test "Pink Doesn't Move Down" do

    RoomServer.new_room("Austin's Room", :Checkers, "SuperSecret")

    my_room = RoomServer.find("Austin's Room")
    { :ok, my_board } = Map.fetch(my_room.board_state, "Austin's Room")

    good_state = Map.replace(my_board, "53", :empty)
    good_state = Map.replace(good_state, "43", :pink)

    RoomServer.make_move("Austin's Room", "53", "43", :pink)
    { _status, new_state } = RoomServer.make_move("Austin's Room", "43", "53", :pink)

    assert good_state == new_state
  end
end

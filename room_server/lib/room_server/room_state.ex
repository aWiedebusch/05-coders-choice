defmodule RoomServer.RoomState do
    
    defstruct(
      rooms: MapSet.new([])
    )
  end
  
  
defmodule RoomServer.RoomState do
    
    use GenServer

    def start_link(args) do
      Agent.start_link(fn -> args end,
                       name: RoomServer.RoomState)
    end
  end
  
  
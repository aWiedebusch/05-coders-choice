defmodule RoomServer.GameState do
    
    use GenServer

    def start_link() do
      Agent.start_link(fn -> %{} end,
                       name: RoomServer.GameState)
    end
  end
  
  
defmodule RoomServer do

  def start_link do
    GenServer.start_link(RoomServer.Server, [], name: __MODULE__)
  end

  def new_room( name, game, password) do
    GenServer.call(__MODULE__, { :new_room, name, game, password })
  end

  def list_rooms() do
    GenServer.call(__MODULE__, { :list_rooms })
  end

  def find(name) do
    GenServer.call(__MODULE__, { :find_room, name })
  end
  
end

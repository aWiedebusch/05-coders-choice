defmodule RoomServer do

  def start_link do
    GenServer.start_link(RoomServer.Server, [], name: __MODULE__)
  end

  def new_game(:checkers) do
    GenServer.call(__MODULE__, { :checkers })
  end

  def new_game(:chess) do
    GenServer.call(__MODULE__, { :chess })
  end

  def new_game(:stratego) do
    GenServer.call(__MODULE__, { :stratego })
  end

  def make_move(game, move) do
    GenServer.call(__MODULE__, { :make_move, game, move })
  end

  
end

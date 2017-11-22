defmodule Boardgames.PageController do
  use Boardgames.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, %{ "room" => %{ "name" => name, "game" => game, "password" => password}}) do
    RoomServer.new_room(name, game, password)
  end
end

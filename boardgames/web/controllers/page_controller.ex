defmodule Boardgames.PageController do
  use Boardgames.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, %{ "room" => %{ "name" => name, "game" => game, "password" => password}}) do
    RoomServer.new_room( name, game, password)
    conn
    |> put_flash(:info, "Added: #{name}")
    |> redirect(to: page_path(conn, :index))
  end
end

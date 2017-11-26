defmodule Boardgames.PageController do
  use Boardgames.Web, :controller

  def index(conn, _params) do
    render conn, "index.html", rooms: RoomServer.list_rooms
  end

  def create(conn, %{ "room" => %{ "name" => name, "game" => game, "password" => password}}) do
    if(RoomServer.find(name) == nil) do
      RoomServer.new_room( name, game, password)
      conn
      |> put_flash(:info, "Added: #{name}")
      |> redirect(to: page_path(conn, :index))
    else
      conn
      |> put_flash(:error, "Could not add: #{name}")
      |> redirect(to: page_path(conn, :index))
    end
  end

  def show(conn, %{ "id" => id }) do
    room = RoomServer.find(id)
    # raise room
    render(conn, "show.html", room: room)
  end

  # def img_decide(board_state, id) do
  #   {:ok, fill} = Map.fetch(board_state, id)
  #   case(fill) do
  #     :blue ->
  #       opts = [wrapper_tag: :img, attributes: [src: "/images/blueCircle.png"]]
  #       Phoenix.HTML.text_to_html("",opts)
  #     :blue ->
  #       opts = [wrapper_tag: :img, attributes: [src: "/images/pinkCircle.png"]]
  #       Phoenix.HTML.text_to_html("",opts)
  #     _ ->
  #       opts = [wrapper_tag: :img, attributes: [src: ""]]
  #       Phoenix.HTML.text_to_html("",opts)
  #   end
  # end
end

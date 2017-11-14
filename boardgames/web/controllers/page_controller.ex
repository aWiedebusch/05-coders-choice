defmodule Boardgames.PageController do
  use Boardgames.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

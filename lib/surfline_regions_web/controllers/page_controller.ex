defmodule SurflineRegionsWeb.PageController do
  use SurflineRegionsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

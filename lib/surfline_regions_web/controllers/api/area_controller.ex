defmodule SurflineRegionsWeb.Api.AreaController do
  use SurflineRegionsWeb, :controller

  alias SurflineRegions.Areas

  action_fallback(SurflineRegionsWeb.Api.FallbackController)

  def index(conn, _params) do
    area = Areas.list_areas()
    render(conn, "index.json", area: area)
  end

  def show(conn, %{"id" => id}) do
    area = Areas.get_area!(id)
    render(conn, "show.json", area: area)
  end
end

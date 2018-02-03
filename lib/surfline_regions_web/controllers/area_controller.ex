defmodule SurflineRegionsWeb.AreaController do
  use SurflineRegionsWeb, :controller

  alias SurflineRegions.Areas

  def index(conn, _params) do
    areas = Areas.list_areas()
    render(conn, "index.html", areas: areas)
  end

  def show(conn, %{"surfline_id" => surfline_id}) do
    area = Areas.get_area_surfline!(surfline_id)
    render(conn, "show.html", area: area)
  end
end

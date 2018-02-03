defmodule SurflineRegionsWeb.Api.AreaController do
  use SurflineRegionsWeb, :controller

  alias SurflineRegions.Areas

  action_fallback(SurflineRegionsWeb.Api.FallbackController)

  def index(conn, _params) do
    area = Areas.list_areas()
    render(conn, "index.json", area: area)
  end

  def show(conn, %{"surfline_id" => surfline_id}) do
    area = Areas.get_area_surfline!(surfline_id)
    render(conn, "show.json", area: area)
  end
end

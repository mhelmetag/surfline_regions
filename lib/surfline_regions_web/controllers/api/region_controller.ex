defmodule SurflineRegionsWeb.Api.RegionController do
  use SurflineRegionsWeb, :controller

  alias SurflineRegions.Areas
  alias SurflineRegions.Regions

  action_fallback(SurflineRegionsWeb.Api.FallbackController)

  def index(conn, %{"area_surfline_id" => area_surfline_id}) do
    area = Areas.get_area_surfline!(area_surfline_id)
    regions = Regions.list_regions_by_area(area)
    render(conn, "index.json", regions: regions)
  end

  def show(conn, %{"surfline_id" => surfline_id}) do
    region = Regions.get_region_surfline!(surfline_id)
    render(conn, "show.json", region: region)
  end
end

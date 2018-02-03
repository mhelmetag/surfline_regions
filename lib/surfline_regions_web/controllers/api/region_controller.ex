defmodule SurflineRegionsWeb.Api.RegionController do
  use SurflineRegionsWeb, :controller

  alias SurflineRegions.Areas
  alias SurflineRegions.Regions

  action_fallback(SurflineRegionsWeb.Api.FallbackController)

  def index(conn, %{"area_id" => area_id}) do
    area = Areas.get_area!(area_id)
    regions = Regions.list_regions_by_area(area)
    render(conn, "index.json", regions: regions)
  end

  def show(conn, %{"area_id" => _area_id, "id" => id}) do
    region = Regions.get_region!(id)
    render(conn, "show.json", region: region)
  end
end

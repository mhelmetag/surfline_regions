defmodule SurflineRegionsWeb.RegionController do
  use SurflineRegionsWeb, :controller

  alias SurflineRegions.Areas
  alias SurflineRegions.Regions

  def index(conn, %{"area_surfline_id" => area_surfline_id}) do
    area = Areas.get_area_surfline!(area_surfline_id)
    regions = Regions.list_regions_by_area(area)
    render(conn, "index.html", area: area, regions: regions)
  end

  def show(conn, %{
        "area_surfline_id" => area_surfline_id,
        "surfline_id" => surfline_id
      }) do
    area = Areas.get_area_surfline!(area_surfline_id)
    region = Regions.get_region_surfline!(surfline_id)
    render(conn, "show.html", area: area, region: region)
  end
end

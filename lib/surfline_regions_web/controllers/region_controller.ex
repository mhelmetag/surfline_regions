defmodule SurflineRegionsWeb.RegionController do
  use SurflineRegionsWeb, :controller

  alias SurflineRegions.Areas
  alias SurflineRegions.Regions

  def index(conn, %{"area_id" => area_id}) do
    area = Areas.get_area!(area_id)
    regions = Regions.list_regions_by_area(area)
    render(conn, "index.html", area: area, regions: regions)
  end

  def show(conn, %{"area_id" => area_id, "id" => id}) do
    area = Areas.get_area!(area_id)
    region = Regions.get_region!(id)
    render(conn, "show.html", area: area, region: region)
  end
end

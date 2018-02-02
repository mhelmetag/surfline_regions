defmodule SurflineRegionsWeb.SubRegionController do
  use SurflineRegionsWeb, :controller

  alias SurflineRegions.Areas
  alias SurflineRegions.Regions
  alias SurflineRegions.SubRegions

  def index(conn, %{"area_id" => area_id, "region_id" => region_id}) do
    area = Areas.get_area!(area_id)
    region = Regions.get_region!(region_id)
    sub_regions = SubRegions.list_sub_regions_by_region(region.id)

    render(
      conn,
      "index.html",
      area: area,
      region: region,
      sub_regions: sub_regions
    )
  end

  def show(conn, %{"area_id" => area_id, "region_id" => region_id, "id" => id}) do
    area = Areas.get_area!(area_id)
    region = Regions.get_region!(region_id)
    sub_region = SubRegions.get_sub_region!(id)

    render(
      conn,
      "show.html",
      area: area,
      region: region,
      sub_region: sub_region
    )
  end
end

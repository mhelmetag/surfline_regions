defmodule SurflineRegionsWeb.SubRegionController do
  use SurflineRegionsWeb, :controller

  alias SurflineRegions.Areas
  alias SurflineRegions.Regions
  alias SurflineRegions.SubRegions

  def index(conn, %{
        "area_surfline_id" => area_surfline_id,
        "region_surfline_id" => region_surfline_id
      }) do
    area = Areas.get_area_surfline!(area_surfline_id)
    region = Regions.get_region_surfline!(region_surfline_id)
    sub_regions = SubRegions.list_sub_regions_by_region(region)

    render(
      conn,
      "index.html",
      area: area,
      region: region,
      sub_regions: sub_regions
    )
  end

  def show(conn, %{
        "area_surfline_id" => area_surfline_id,
        "region_surfline_id" => region_surfline_id,
        "surfline_id" => surfline_id
      }) do
    area = Areas.get_area_surfline!(area_surfline_id)
    region = Regions.get_region_surfline!(region_surfline_id)
    sub_region = SubRegions.get_sub_region_surfline!(surfline_id)

    render(
      conn,
      "show.html",
      area: area,
      region: region,
      sub_region: sub_region
    )
  end
end

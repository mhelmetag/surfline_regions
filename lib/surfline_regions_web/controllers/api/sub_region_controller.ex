defmodule SurflineRegionsWeb.Api.SubRegionController do
  use SurflineRegionsWeb, :controller

  alias SurflineRegions.Regions
  alias SurflineRegions.SubRegions

  action_fallback(SurflineRegionsWeb.Api.FallbackController)

  def index(conn, %{"area_id" => _area_id, "region_id" => region_id}) do
    region = Regions.get_region!(region_id)
    sub_regions = SubRegions.list_sub_regions_by_region(region)
    render(conn, "index.json", sub_regions: sub_regions)
  end

  def show(conn, %{"area_id" => _area_id, "region_id" => _region_id, "id" => id}) do
    sub_region = SubRegions.get_sub_region!(id)
    render(conn, "show.json", sub_region: sub_region)
  end
end

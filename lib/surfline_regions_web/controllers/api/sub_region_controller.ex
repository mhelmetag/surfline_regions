defmodule SurflineRegionsWeb.Api.SubRegionController do
  use SurflineRegionsWeb, :controller

  alias SurflineRegions.Regions
  alias SurflineRegions.SubRegions

  action_fallback(SurflineRegionsWeb.Api.FallbackController)

  def index(conn, %{"region_surfline_id" => region_surfline_id}) do
    region = Regions.get_region_surfline!(region_surfline_id)
    sub_regions = SubRegions.list_sub_regions_by_region(region)
    render(conn, "index.json", sub_regions: sub_regions)
  end

  def show(conn, %{"surfline_id" => surfline_id}) do
    sub_region = SubRegions.get_sub_region_surfline!(surfline_id)
    render(conn, "show.json", sub_region: sub_region)
  end
end

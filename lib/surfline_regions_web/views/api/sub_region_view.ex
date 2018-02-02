defmodule SurflineRegionsWeb.Api.SubRegionView do
  use SurflineRegionsWeb, :view
  alias SurflineRegionsWeb.Api.SubRegionView

  def render("index.json", %{sub_regions: sub_regions}) do
    %{data: render_many(sub_regions, SubRegionView, "sub_region.json")}
  end

  def render("show.json", %{sub_region: sub_region}) do
    %{data: render_one(sub_region, SubRegionView, "sub_region.json")}
  end

  def render("sub_region.json", %{sub_region: sub_region}) do
    %{
      id: sub_region.id,
      surfline_id: sub_region.surfline_id,
      name: sub_region.name
    }
  end
end

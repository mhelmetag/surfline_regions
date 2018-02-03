defmodule SurflineRegionsWeb.Api.RegionView do
  use SurflineRegionsWeb, :view
  alias SurflineRegionsWeb.Api.RegionView

  def render("index.json", %{regions: regions}) do
    %{data: render_many(regions, RegionView, "region.json")}
  end

  def render("show.json", %{region: region}) do
    %{data: render_one(region, RegionView, "region.json")}
  end

  def render("region.json", %{region: region}) do
    %{surfline_id: region.surfline_id, name: region.name}
  end
end

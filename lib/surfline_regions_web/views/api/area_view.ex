defmodule SurflineRegionsWeb.Api.AreaView do
  use SurflineRegionsWeb, :view
  alias SurflineRegionsWeb.Api.AreaView

  def render("index.json", %{area: area}) do
    %{data: render_many(area, AreaView, "area.json")}
  end

  def render("show.json", %{area: area}) do
    %{data: render_one(area, AreaView, "area.json")}
  end

  def render("area.json", %{area: area}) do
    %{id: area.surfline_id, name: area.name}
  end
end

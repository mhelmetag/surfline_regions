defmodule SurflineRegionsWeb.RegionControllerTest do
  use SurflineRegionsWeb.ConnCase

  alias SurflineRegions.Regions

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:region) do
    {:ok, region} = Regions.create_region(@create_attrs)
    region
  end

  describe "index" do
    test "lists all regions", %{conn: conn} do
      conn = get(conn, region_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Regions"
    end
  end

  describe "show" do
  end
end

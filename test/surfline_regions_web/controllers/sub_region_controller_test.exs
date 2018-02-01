defmodule SurflineRegionsWeb.SubRegionControllerTest do
  use SurflineRegionsWeb.ConnCase

  alias SurflineRegions.SubRegions

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:sub_region) do
    {:ok, sub_region} = SubRegions.create_sub_region(@create_attrs)
    sub_region
  end

  describe "index" do
    test "lists all sub_regions", %{conn: conn} do
      conn = get(conn, sub_region_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Sub regions"
    end
  end

  describe "show" do
  end
end

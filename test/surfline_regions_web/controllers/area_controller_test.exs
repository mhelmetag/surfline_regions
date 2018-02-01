defmodule SurflineRegionsWeb.AreaControllerTest do
  use SurflineRegionsWeb.ConnCase

  alias SurflineRegions.Areas

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  def fixture(:area) do
    {:ok, area} = Areas.create_area(@create_attrs)
    area
  end

  describe "index" do
    test "lists all areas", %{conn: conn} do
      conn = get(conn, area_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Areas"
    end
  end

  describe "show" do
  end
end

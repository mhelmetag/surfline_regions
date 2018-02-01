defmodule SurflineRegions.SubRegionsTest do
  use SurflineRegions.DataCase

  alias SurflineRegions.SubRegions

  describe "sub_regions" do
    alias SurflineRegions.SubRegions.SubRegion

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def sub_region_fixture(attrs \\ %{}) do
      {:ok, sub_region} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SubRegions.create_sub_region()

      sub_region
    end

    test "list_sub_regions/0 returns all sub_regions" do
      sub_region = sub_region_fixture()
      assert SubRegions.list_sub_regions() == [sub_region]
    end

    test "get_sub_region!/1 returns the sub_region with given id" do
      sub_region = sub_region_fixture()
      assert SubRegions.get_sub_region!(sub_region.id) == sub_region
    end

    test "create_sub_region/1 with valid data creates a sub_region" do
      assert {:ok, %SubRegion{} = sub_region} =
               SubRegions.create_sub_region(@valid_attrs)
    end

    test "create_sub_region/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} =
               SubRegions.create_sub_region(@invalid_attrs)
    end

    test "update_sub_region/2 with valid data updates the sub_region" do
      sub_region = sub_region_fixture()

      assert {:ok, sub_region} =
               SubRegions.update_sub_region(sub_region, @update_attrs)

      assert %SubRegion{} = sub_region
    end

    test "update_sub_region/2 with invalid data returns error changeset" do
      sub_region = sub_region_fixture()

      assert {:error, %Ecto.Changeset{}} =
               SubRegions.update_sub_region(sub_region, @invalid_attrs)

      assert sub_region == SubRegions.get_sub_region!(sub_region.id)
    end

    test "delete_sub_region/1 deletes the sub_region" do
      sub_region = sub_region_fixture()
      assert {:ok, %SubRegion{}} = SubRegions.delete_sub_region(sub_region)

      assert_raise Ecto.NoResultsError, fn ->
        SubRegions.get_sub_region!(sub_region.id)
      end
    end

    test "change_sub_region/1 returns a sub_region changeset" do
      sub_region = sub_region_fixture()
      assert %Ecto.Changeset{} = SubRegions.change_sub_region(sub_region)
    end
  end
end

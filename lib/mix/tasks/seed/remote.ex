defmodule Mix.Tasks.Seed.Remote do
  @moduledoc """
  Mix task to fetch the current set of Areas, Regions and Sub Regions
  from Surfline to hydrate the database.
  """

  use Mix.Task

  alias SurflineRegions.Areas
  alias SurflineRegions.Regions.Region
  alias SurflineRegions.SubRegions.SubRegion
  alias SurflineRegions.Repo

  alias SurflineRegionsFetcher, as: Fetcher

  def run(_args) do
    {:ok, _started} = Application.ensure_all_started(:surfline_regions_fetcher)
    {:ok, _started} = Application.ensure_all_started(:surfline_regions)

    area_maps = get_area_maps()

    area_maps
    |> create_areas
  end

  def get_area_maps do
    Fetcher.Areas.get_areas()
  end

  def create_areas(maps) do
    Enum.map(maps, fn map ->
      area = Areas.create_area(%{name: map.name, surfline_id: map.surfline_id})
      region_maps = get_region_maps(area.surfline_id)

      region_maps
      |> create_regions(area)
    end)
  end

  def get_region_maps(area_id) do
    Fetcher.Regions.get_regions(area_id)
  end

  def create_regions(maps, area) do
    Enum.map(maps, fn map ->
      region =
        Repo.insert!(%Region{
          name: map.name,
          surfline_id: map.surfline_id,
          area: area
        })

      sub_region_maps = get_sub_region_maps(region.surfline_id)

      sub_region_maps
      |> create_sub_regions(region)
    end)
  end

  def get_sub_region_maps(region_id) do
    Fetcher.SubRegions.get_sub_regions(region_id)
  end

  def create_sub_regions(maps, region) do
    Enum.map(maps, fn map ->
      Repo.insert!(%SubRegion{
        name: map.name,
        surfline_id: map.surfline_id,
        region: region
      })
    end)
  end
end

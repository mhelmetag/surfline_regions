defmodule SurflineRegions.SubRegions do
  @moduledoc """
  The Sub Regions context for all your Sub Region needs.
  """

  import Ecto.Query, warn: false
  alias SurflineRegions.Repo

  alias SurflineRegions.SubRegions.SubRegion

  @doc """
  Returns the list of Sub Regions.

  ## Examples

      iex> list_sub_regions()
      [%SubRegion{}, ...]

  """
  def list_sub_regions do
    Repo.all(SubRegion)
  end

  @doc """
  Returns the list of Sub Regions in a Region.

  ## Examples

      iex> list_sub_regions_by_region(%Region{})
      [%SubRegion{}, ...]
  """
  def list_sub_regions_by_region(region) do
    query = from(sr in SubRegion, where: sr.region_id == ^region.id)

    Repo.all(query)
  end

  @doc """
  Gets a single Sub Region.

  Raises if the Sub Region does not exist.

  ## Examples

      iex> get_sub_region!(123)
      %SubRegion{}

  """
  def get_sub_region!(id), do: Repo.get!(SubRegion, id)

  @doc """
  Creates a Sub Region.

  ## Examples

      iex> create_sub_region(%{field: value})
      {:ok, %SubRegion{}}

      iex> create_sub_region(%{field: bad_value})
      {:error, ...}

  """
  def create_sub_region(attrs \\ %{}) do
    %SubRegion{}
    |> SubRegion.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a Sub Region.

  ## Examples

      iex> update_sub_region(sub_region, %{field: new_value})
      {:ok, %SubRegion{}}

      iex> update_sub_region(sub_region, %{field: bad_value})
      {:error, ...}

  """
  def update_sub_region(%SubRegion{} = sub_region, attrs) do
    sub_region
    |> SubRegion.changeset(attrs)
    |> Repo.update()
  end
end

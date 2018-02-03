defmodule SurflineRegions.Regions do
  @moduledoc """
  The Regions context for all your Region needs.
  """

  import Ecto.Query, warn: false
  alias SurflineRegions.Repo

  alias SurflineRegions.Regions.Region

  @doc """
  Returns the list of Regions.

  ## Examples

      iex> list_regions()
      [%Region{}, ...]

  """
  def list_regions do
    Repo.all(Region)
  end

  @doc """
  Returns the list of Region in an Area.

  ## Examples

      iex> list_regions_by_area(%Area{})
      [%Region{}, ...]
  """
  def list_regions_by_area(area) do
    query = from(r in Region, where: r.area_id == ^area.id)

    Repo.all(query)
  end

  @doc """
  Gets a single Region.

  Raises if the Region does not exist.

  ## Examples

      iex> get_region!(123)
      %Region{}

  """
  def get_region!(id), do: Repo.get!(Region, id)

  def get_region_surfline!(surfline_id), do: Repo.get_by!(Region, surfline_id: surfline_id)

  @doc """
  Creates a Region.

  ## Examples

      iex> create_region(%{field: value})
      {:ok, %Region{}}

      iex> create_region(%{field: bad_value})
      {:error, ...}

  """
  def create_region(attrs \\ %{}) do
    %Region{}
    |> Region.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a Region.

  ## Examples

      iex> update_region(region, %{field: new_value})
      {:ok, %Region{}}

      iex> update_region(region, %{field: bad_value})
      {:error, ...}

  """
  def update_region(%Region{} = region, attrs) do
    region
    |> Region.changeset(attrs)
    |> Repo.update()
  end
end

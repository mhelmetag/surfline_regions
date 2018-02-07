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

  Raises `Ecto.NoResultsError` if the Region does not exist.

  ## Examples

      iex> get_region!(123)
      %Region{}

      iex> get_region!(456)
      ** (Ecto.NoResultsError)

  """
  def get_region!(id), do: Repo.get!(Region, id)

  @doc """
  Gets a single Region by Surfline ID.

  Raises `Ecto.NoResultsError` if the Region does not exist.

  ## Examples

      iex> get_region_surfline!("123")
      %Region{}

      iex> get_region_surfline!("456")
      ** (Ecto.NoResultsError)

  """
  def get_region_surfline!(surfline_id),
    do: Repo.get_by!(Region, surfline_id: surfline_id)

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

  @doc """
  Finds or creates a Region by Surfline ID.

  ## Examples

      iex> find_or_create_region(%{name: "Nowhere", "1"})
      {:ok, %Region{}}

  """
  def find_or_create_region(attrs \\ %{}) do
    query = (from r in Region, where: r.surfline_id == ^attrs.surfline_id)
    region = Repo.one(query)

    case region do
      nil -> create_region(attrs)
      _ -> {:ok, region}
    end
  end
end

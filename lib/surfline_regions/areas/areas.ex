defmodule SurflineRegions.Areas do
  @moduledoc """
  The Areas context for all your Area needs.
  """

  import Ecto.Query, warn: false
  alias SurflineRegions.Repo

  alias SurflineRegions.Areas.Area

  @doc """
  Returns the list of Areas.

  ## Examples

      iex> list_areas()
      [%Area{}, ...]

  """
  def list_areas do
    Repo.all(Area)
  end

  @doc """
  Gets a single Area.

  Raises `Ecto.NoResultsError` if the Area does not exist.

  ## Examples

      iex> get_area!(123)
      %Area{}

      iex> get_area!(456)
      ** (Ecto.NoResultsError)

  """
  def get_area!(id), do: Repo.get!(Area, id)

  @doc """
  Creates an Area.

  ## Examples

      iex> create_area(%{field: value})
      {:ok, %Area{}}

      iex> create_area(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_area(attrs \\ %{}) do
    %Area{}
    |> Area.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates an Area.

  ## Examples

      iex> update_area(area, %{field: new_value})
      {:ok, %Area{}}

      iex> update_area(area, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_area(%Area{} = area, attrs) do
    area
    |> Area.changeset(attrs)
    |> Repo.update()
  end
end

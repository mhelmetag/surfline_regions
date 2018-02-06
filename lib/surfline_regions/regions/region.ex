defmodule SurflineRegions.Regions.Region do
  @moduledoc """
  The Region model.

  The second tier in the Surfline spot hierarchy.
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias SurflineRegions.Regions.Region
  alias SurflineRegions.Areas.Area
  alias SurflineRegions.SubRegions.SubRegion

  schema "regions" do
    field(:name, :string)
    field(:surfline_id, :string)

    belongs_to(:area, Area)
    has_many(:sub_regions, SubRegion)

    timestamps()
  end

  @doc false
  def changeset(%Region{} = region, attrs) do
    region
    |> cast(attrs, [:name, :surfline_id, :area_id])
    |> assoc_constraint(:area)
    |> validate_required([:name, :surfline_id])
    |> unique_constraint(:surfline_id)
  end
end

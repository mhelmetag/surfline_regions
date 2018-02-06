defmodule SurflineRegions.SubRegions.SubRegion do
  @moduledoc """
  The SubRegion model.

  The third tier in the Surfline spot hierarchy.
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias SurflineRegions.SubRegions.SubRegion
  alias SurflineRegions.Regions.Region

  schema "sub_regions" do
    field(:name, :string)
    field(:surfline_id, :string)

    belongs_to(:region, Region)

    timestamps()
  end

  @doc false
  def changeset(%SubRegion{} = sub_region, attrs) do
    sub_region
    |> cast(attrs, [:name, :surfline_id, :region_id])
    |> assoc_constraint(:region)
    |> validate_required([:name, :surfline_id])
    |> unique_constraint(:surfline_id)
  end
end

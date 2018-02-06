defmodule SurflineRegions.Areas.Area do
  @moduledoc """
  The Area model.

  The first tier in the Surfline spot hierarchy.
  """

  use Ecto.Schema
  import Ecto.Changeset
  alias SurflineRegions.Areas.Area
  alias SurflineRegions.Regions.Region

  schema "areas" do
    field(:name, :string)
    field(:surfline_id, :string)

    has_many(:regions, Region)

    timestamps()
  end

  @doc false
  def changeset(%Area{} = area, attrs) do
    area
    |> cast(attrs, [:name, :surfline_id])
    |> validate_required([:name, :surfline_id])
    |> unique_constraint(:name)
    |> unique_constraint(:surfline_id)
  end
end

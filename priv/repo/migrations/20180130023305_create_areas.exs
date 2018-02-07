defmodule SurflineRegions.Repo.Migrations.CreateAreas do
  use Ecto.Migration

  def change do
    create table(:areas) do
      add :name, :string, null: false
      add :surfline_id, :string, null: false

      timestamps()
    end

    create unique_index(:areas, [:surfline_id])
  end
end

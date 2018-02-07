defmodule SurflineRegions.Repo.Migrations.CreateRegions do
  use Ecto.Migration

  def change do
    create table(:regions) do
      add :name, :string, null: false
      add :surfline_id, :string, null: false
      add :area_id, references(:areas), null: false

      timestamps()
    end

    create unique_index(:regions, [:surfline_id])
    create index(:regions, [:area_id])
  end
end

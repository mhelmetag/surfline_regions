defmodule SurflineRegions.Repo.Migrations.CreateSubRegions do
  use Ecto.Migration

  def change do
    create table(:sub_regions) do
      add :name, :string, null: false
      add :surfline_id, :string, null: false
      add :region_id, references(:regions), null: false

      timestamps()
    end

    create unique_index(:sub_regions, [:name])
    create index(:sub_regions, [:region_id])
  end
end

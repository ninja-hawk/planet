defmodule Planet.Repo.Migrations.CreateSolutionAssets do
  use Ecto.Migration

  def change do
    create table(:solution_assets) do
      add :solution_id, references(:solutions, on_delete: :delete_all)
      add :asset_id, references(:assets, on_delete: :delete_all)
      add :deleted_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end

    create unique_index(:solution_assets, [:solution_id, :asset_id])
  end
end

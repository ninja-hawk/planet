defmodule Planet.Repo.Migrations.CreateAssets do
  use Ecto.Migration

  def change do
    create table(:assets) do
      add :name, :string, null: false
      add :description, :string, null: false
      add :eco_effect, :integer
      add :is_skill, :boolean, null: false, default: false
      add :is_duplicatable, :boolean, default: false
      add :deleted_at, :utc_datetime

      timestamps()
    end

    create index(:assets, [:name])
  end
end

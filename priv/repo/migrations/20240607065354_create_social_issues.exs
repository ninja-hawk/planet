defmodule Planet.Repo.Migrations.CreateSocialIssues do
  use Ecto.Migration

  def change do
    create table(:social_issues) do
      add :name, :string, size: 30, null: false
      add :situation, :string, size: 511, null: false
      add :possible_solution, :string, size: 30
      add :youth_effect, :integer, null: false
      add :economic_growth_effect, :integer, null: false
      add :co2_effect, :integer, null: false
      add :is_question, :boolean, default: false, null: false
      add :is_last, :boolean, default: false, null: false
      add :tip, :string, size: 511
      add :deleted_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end

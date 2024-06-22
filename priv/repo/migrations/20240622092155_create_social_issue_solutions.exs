defmodule Planet.Repo.Migrations.CreateSocialIssueSolutions do
  use Ecto.Migration

  def change do
    create table(:social_issue_solutions) do
      add :social_issue_id, references(:social_issues, on_delete: :delete_all)
      add :solution_id, references(:solutions, on_delete: :delete_all)
      add :deleted_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end

    create index(:social_issue_solutions, [:social_issue_id, :solution_id])
  end
end

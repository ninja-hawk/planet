defmodule Planet.Repo.Migrations.CreateSocialIssueFlows do
  use Ecto.Migration

  def change do
    create table(:social_issue_flows) do
      add :social_issue_id, references(:social_issues, on_delete: :delete_all)
      add :next_social_issue_id, references(:social_issues, on_delete: :delete_all)
      add :is_yes, :boolean, default: false, null: false
      add :deleted_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end

    create index(:social_issue_flows, [:social_issue_id])
    create index(:social_issue_flows, [:next_social_issue_id])
  end
end

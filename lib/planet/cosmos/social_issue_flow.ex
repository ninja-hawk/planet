defmodule Planet.Cosmos.SocialIssueFlow do
  use Ecto.Schema
  import Ecto.Changeset

  schema "social_issue_flows" do
    field :social_issue_id, :integer
    field :next_social_issue_id, :integer
    field :is_yes, :boolean, default: false
    field :deleted_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(social_issue_flow, attrs) do
    social_issue_flow
    |> cast(attrs, [:social_issue_id, :next_social_issue_id, :is_yes, :deleted_at])
    |> validate_required([:social_issue_id, :next_social_issue_id, :is_yes])
  end
end

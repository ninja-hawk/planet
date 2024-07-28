defmodule Planet.Cosmos.SocialIssueFlow do
  use Ecto.Schema
  import Ecto.Changeset
  alias Planet.Cosmos.SocialIssue

  schema "social_issue_flows" do
    # field :social_issue_id, :integer
    # field :next_social_issue_id, :integer
    field :is_yes, :boolean, default: false
    field :deleted_at, :utc_datetime

    belongs_to :current_social_issue, SocialIssue, foreign_key: :social_issue_id
    belongs_to :next_social_issue, SocialIssue, foreign_key: :next_social_issue_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(social_issue_flow, attrs) do
    social_issue_flow
    |> cast(attrs, [:social_issue_id, :next_social_issue_id, :is_yes, :deleted_at])
    |> validate_required([:social_issue_id, :next_social_issue_id, :is_yes])
  end
end

defmodule Planet.Cosmos.SocialIssueSolution do
  use Ecto.Schema
  import Ecto.Changeset

  schema "social_issue_solutions" do
    field :social_issue_id, :id
    field :solution_id, :id
    field :deleted_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(social_issue_solution, attrs) do
    social_issue_solution
    |> cast(attrs, [:social_issue_id, :solution_id, :deleted_at])
    |> validate_required([:social_issue_id, :solution_id])
  end
end

defmodule Planet.Cosmos.SocialIssue do
  use Ecto.Schema
  import Ecto.Changeset
  alias Planet.Cosmos.Solution

  schema "social_issues" do
    field :name, :string
    field :situation, :string
    field :possible_solution, :string
    field :youth_effect, :integer
    field :economic_growth_effect, :integer
    field :co2_effect, :integer
    field :is_question, :boolean, default: false
    field :is_last, :boolean, default: false
    field :tip, :string
    field :deleted_at, :utc_datetime

    many_to_many :solutions, Solution, join_through: "social_issue_solutions", on_replace: :delete

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(social_issue, attrs) do
    social_issue
    |> cast(attrs, [:name, :situation, :possible_solution, :youth_effect, :economic_growth_effect, :co2_effect, :is_question, :is_last, :tip, :deleted_at])
    |> validate_required([:name, :situation,:youth_effect, :economic_growth_effect, :co2_effect, :is_question, :is_last])
    |> validate_length(:name, max: 30)
    |> validate_length(:situation, max: 511)
    |> validate_length(:possible_solution, max: 127)
    |> validate_length(:tip, max: 511)
  end
end

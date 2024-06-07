defmodule Planet.Cosmos.Solution do
  use Ecto.Schema
  import Ecto.Changeset

  schema "solutions" do
    field :name, :string
    field :description, :string
    field :comment, :string
    field :low_capital_input, :integer
    field :middle_capital_input, :integer
    field :high_capital_input, :integer
    field :low_return, :integer
    field :middle_return, :integer
    field :high_return, :integer
    field :roi_func_id, :integer
    field :co2_effect, :integer
    field :is_choice, :boolean, default: false
    field :deleted_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(solution, attrs) do
    solution
    |> cast(attrs, [:name, :description, :low_capital_input, :middle_capital_input, :high_capital_input, :low_return, :middle_return, :high_return, :roi_func_id, :co2_effect, :is_choice, :comment, :deleted_at])
    |> validate_required([:name, :description, :low_capital_input, :middle_capital_input, :high_capital_input, :low_return, :middle_return, :high_return, :co2_effect, :is_choice])
    |> validate_length(:name, max: 127)
    |> validate_length(:description, max: 511)
    |> validate_length(:comment, max: 511)
  end
end

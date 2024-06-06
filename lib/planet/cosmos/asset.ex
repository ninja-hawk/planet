defmodule Planet.Cosmos.Asset do
  use Ecto.Schema
  import Ecto.Changeset

  schema "assets" do
    field :name, :string
    field :description, :string
    field :eco_effect, :integer
    field :is_skill, :boolean, default: false
    field :is_duplicatable, :boolean, default: false
    field :deleted_at, :utc_datetime

    timestamps()
  end

  @doc false
  def changeset(asset, attrs) do
    asset
    |> cast(attrs, [:name, :description, :eco_effect, :is_skill, :is_duplicatable, :deleted_at])
    |> validate_required([:name, :description, :eco_effect, :is_skill, :is_duplicatable])
    |> validate_length(:name, max: 30)
    |> validate_length(:description, max: 511)
    |> validate_number(:eco_effect, greater_than_or_equal_to: 0)
  end
end

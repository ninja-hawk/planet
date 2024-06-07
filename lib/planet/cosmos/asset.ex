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
    |> validate_required([:name, :description, :is_skill])
    |> validate_length(:name, max: 30)
    |> validate_length(:description, max: 511)
  end
end

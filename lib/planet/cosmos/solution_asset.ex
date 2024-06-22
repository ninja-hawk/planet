defmodule Planet.Cosmos.SolutionAsset do
  use Ecto.Schema
  import Ecto.Changeset

  schema "solution_assets" do
    field :solution_id, :integer
    field :asset_id, :integer
    field :deleted_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(solution_asset, attrs) do
    solution_asset
    |> cast(attrs, [:solution_id, :asset_id, :deleted_at])
    |> validate_required([:solution_id, :asset_id])
  end
end

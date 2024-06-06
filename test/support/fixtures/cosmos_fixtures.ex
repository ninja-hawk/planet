defmodule Planet.CosmosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Planet.Cosmos` context.
  """

  @doc """
  Generate a asset.
  """
  def asset_fixture(attrs \\ %{}) do
    {:ok, asset} =
      attrs
      |> Enum.into(%{
        deleted_at: ~U[2024-06-05 07:19:00Z],
        description: "some description",
        eco_effect: 42,
        is_duplicatable: true,
        is_skill: true,
        name: "some name"
      })
      |> Planet.Cosmos.create_asset()

    asset
  end
end

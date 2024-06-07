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

  @doc """
  Generate a social_issue.
  """
  def social_issue_fixture(attrs \\ %{}) do
    {:ok, social_issue} =
      attrs
      |> Enum.into(%{
        co2_effect: 42,
        deleted_at: ~U[2024-06-06 06:53:00Z],
        economic_growth_effect: 42,
        is_last: true,
        is_question: true,
        name: "some name",
        possible_solution: "some possible_solution",
        situation: "some situation",
        tip: "some tip",
        youth_effect: 42
      })
      |> Planet.Cosmos.create_social_issue()

    social_issue
  end
end

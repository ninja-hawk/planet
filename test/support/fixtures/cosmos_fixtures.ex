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

  @doc """
  Generate a solution.
  """
  def solution_fixture(attrs \\ %{}) do
    {:ok, solution} =
      attrs
      |> Enum.into(%{
        co2_effect: 42,
        comment: "some comment",
        deleted_at: ~U[2024-06-06 09:40:00Z],
        description: "some description",
        high_capital_input: 42,
        high_return: 42,
        is_choice: true,
        low_capital_input: 42,
        low_return: 42,
        middle_capital_input: 42,
        middle_return: 42,
        name: "some name",
        roi_func_id: 42
      })
      |> Planet.Cosmos.create_solution()

    solution
  end

  @doc """
  Generate a solution_asset.
  """
  def solution_asset_fixture(attrs \\ %{}) do
    {:ok, solution_asset} =
      attrs
      |> Enum.into(%{
        asset_id: 42,
        deleted_at: ~U[2024-06-21 08:05:00Z],
        solution_id: 42
      })
      |> Planet.Cosmos.create_solution_asset()

    solution_asset
  end

  @doc """
  Generate a social_issue_solution.
  """
  def social_issue_solution_fixture(attrs \\ %{}) do
    {:ok, social_issue_solution} =
      attrs
      |> Enum.into(%{
        deleted_at: ~U[2024-06-21 09:21:00Z]
      })
      |> Planet.Cosmos.create_social_issue_solution()

    social_issue_solution
  end
end

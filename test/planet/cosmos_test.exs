defmodule Planet.CosmosTest do
  use Planet.DataCase

  alias Planet.Cosmos

  describe "assets" do
    alias Planet.Cosmos.Asset

    import Planet.CosmosFixtures

    @invalid_attrs %{name: nil, description: nil, eco_effect: nil, is_skill: nil, is_duplicatable: nil, deleted_at: nil}

    test "list_assets/0 returns all assets" do
      asset = asset_fixture()
      assert Cosmos.list_assets() == [asset]
    end

    test "get_asset!/1 returns the asset with given id" do
      asset = asset_fixture()
      assert Cosmos.get_asset!(asset.id) == asset
    end

    test "create_asset/1 with valid data creates a asset" do
      valid_attrs = %{name: "some name", description: "some description", eco_effect: 42, is_skill: true, is_duplicatable: true, deleted_at: ~U[2024-06-05 07:19:00Z]}

      assert {:ok, %Asset{} = asset} = Cosmos.create_asset(valid_attrs)
      assert asset.name == "some name"
      assert asset.description == "some description"
      assert asset.eco_effect == 42
      assert asset.is_skill == true
      assert asset.is_duplicatable == true
      assert asset.deleted_at == ~U[2024-06-05 07:19:00Z]
    end

    test "create_asset/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cosmos.create_asset(@invalid_attrs)
    end

    test "update_asset/2 with valid data updates the asset" do
      asset = asset_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", eco_effect: 43, is_skill: false, is_duplicatable: false, deleted_at: ~U[2024-06-06 07:19:00Z]}

      assert {:ok, %Asset{} = asset} = Cosmos.update_asset(asset, update_attrs)
      assert asset.name == "some updated name"
      assert asset.description == "some updated description"
      assert asset.eco_effect == 43
      assert asset.is_skill == false
      assert asset.is_duplicatable == false
      assert asset.deleted_at == ~U[2024-06-06 07:19:00Z]
    end

    test "update_asset/2 with invalid data returns error changeset" do
      asset = asset_fixture()
      assert {:error, %Ecto.Changeset{}} = Cosmos.update_asset(asset, @invalid_attrs)
      assert asset == Cosmos.get_asset!(asset.id)
    end

    test "delete_asset/1 deletes the asset" do
      asset = asset_fixture()
      assert {:ok, %Asset{}} = Cosmos.delete_asset(asset)
      assert_raise Ecto.NoResultsError, fn -> Cosmos.get_asset!(asset.id) end
    end

    test "change_asset/1 returns a asset changeset" do
      asset = asset_fixture()
      assert %Ecto.Changeset{} = Cosmos.change_asset(asset)
    end
  end

  describe "social_issues" do
    alias Planet.Cosmos.SocialIssue

    import Planet.CosmosFixtures

    @invalid_attrs %{name: nil, situation: nil, possible_solution: nil, youth_effect: nil, economic_growth_effect: nil, co2_effect: nil, is_question: nil, is_last: nil, tip: nil, deleted_at: nil}

    test "list_social_issues/0 returns all social_issues" do
      social_issue = social_issue_fixture()
      assert Cosmos.list_social_issues() == [social_issue]
    end

    test "get_social_issue!/1 returns the social_issue with given id" do
      social_issue = social_issue_fixture()
      assert Cosmos.get_social_issue!(social_issue.id) == social_issue
    end

    test "create_social_issue/1 with valid data creates a social_issue" do
      valid_attrs = %{name: "some name", situation: "some situation", possible_solution: "some possible_solution", youth_effect: 42, economic_growth_effect: 42, co2_effect: 42, is_question: true, is_last: true, tip: "some tip", deleted_at: ~U[2024-06-06 06:53:00Z]}

      assert {:ok, %SocialIssue{} = social_issue} = Cosmos.create_social_issue(valid_attrs)
      assert social_issue.name == "some name"
      assert social_issue.situation == "some situation"
      assert social_issue.possible_solution == "some possible_solution"
      assert social_issue.youth_effect == 42
      assert social_issue.economic_growth_effect == 42
      assert social_issue.co2_effect == 42
      assert social_issue.is_question == true
      assert social_issue.is_last == true
      assert social_issue.tip == "some tip"
      assert social_issue.deleted_at == ~U[2024-06-06 06:53:00Z]
    end

    test "create_social_issue/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cosmos.create_social_issue(@invalid_attrs)
    end

    test "update_social_issue/2 with valid data updates the social_issue" do
      social_issue = social_issue_fixture()
      update_attrs = %{name: "some updated name", situation: "some updated situation", possible_solution: "some updated possible_solution", youth_effect: 43, economic_growth_effect: 43, co2_effect: 43, is_question: false, is_last: false, tip: "some updated tip", deleted_at: ~U[2024-06-07 06:53:00Z]}

      assert {:ok, %SocialIssue{} = social_issue} = Cosmos.update_social_issue(social_issue, update_attrs)
      assert social_issue.name == "some updated name"
      assert social_issue.situation == "some updated situation"
      assert social_issue.possible_solution == "some updated possible_solution"
      assert social_issue.youth_effect == 43
      assert social_issue.economic_growth_effect == 43
      assert social_issue.co2_effect == 43
      assert social_issue.is_question == false
      assert social_issue.is_last == false
      assert social_issue.tip == "some updated tip"
      assert social_issue.deleted_at == ~U[2024-06-07 06:53:00Z]
    end

    test "update_social_issue/2 with invalid data returns error changeset" do
      social_issue = social_issue_fixture()
      assert {:error, %Ecto.Changeset{}} = Cosmos.update_social_issue(social_issue, @invalid_attrs)
      assert social_issue == Cosmos.get_social_issue!(social_issue.id)
    end

    test "delete_social_issue/1 deletes the social_issue" do
      social_issue = social_issue_fixture()
      assert {:ok, %SocialIssue{}} = Cosmos.delete_social_issue(social_issue)
      assert_raise Ecto.NoResultsError, fn -> Cosmos.get_social_issue!(social_issue.id) end
    end

    test "change_social_issue/1 returns a social_issue changeset" do
      social_issue = social_issue_fixture()
      assert %Ecto.Changeset{} = Cosmos.change_social_issue(social_issue)
    end
  end

  describe "solutions" do
    alias Planet.Cosmos.Solution

    import Planet.CosmosFixtures

    @invalid_attrs %{name: nil, description: nil, comment: nil, low_capital_input: nil, middle_capital_input: nil, high_capital_input: nil, low_return: nil, middle_return: nil, high_return: nil, roi_func_id: nil, co2_effect: nil, is_choice: nil, deleted_at: nil}

    test "list_solutions/0 returns all solutions" do
      solution = solution_fixture()
      assert Cosmos.list_solutions() == [solution]
    end

    test "get_solution!/1 returns the solution with given id" do
      solution = solution_fixture()
      assert Cosmos.get_solution!(solution.id) == solution
    end

    test "create_solution/1 with valid data creates a solution" do
      valid_attrs = %{name: "some name", description: "some description", comment: "some comment", low_capital_input: 42, middle_capital_input: 42, high_capital_input: 42, low_return: 42, middle_return: 42, high_return: 42, roi_func_id: 42, co2_effect: 42, is_choice: true, deleted_at: ~U[2024-06-06 09:40:00Z]}

      assert {:ok, %Solution{} = solution} = Cosmos.create_solution(valid_attrs)
      assert solution.name == "some name"
      assert solution.description == "some description"
      assert solution.comment == "some comment"
      assert solution.low_capital_input == 42
      assert solution.middle_capital_input == 42
      assert solution.high_capital_input == 42
      assert solution.low_return == 42
      assert solution.middle_return == 42
      assert solution.high_return == 42
      assert solution.roi_func_id == 42
      assert solution.co2_effect == 42
      assert solution.is_choice == true
      assert solution.deleted_at == ~U[2024-06-06 09:40:00Z]
    end

    test "create_solution/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cosmos.create_solution(@invalid_attrs)
    end

    test "update_solution/2 with valid data updates the solution" do
      solution = solution_fixture()
      update_attrs = %{name: "some updated name", description: "some updated description", comment: "some updated comment", low_capital_input: 43, middle_capital_input: 43, high_capital_input: 43, low_return: 43, middle_return: 43, high_return: 43, roi_func_id: 43, co2_effect: 43, is_choice: false, deleted_at: ~U[2024-06-07 09:40:00Z]}

      assert {:ok, %Solution{} = solution} = Cosmos.update_solution(solution, update_attrs)
      assert solution.name == "some updated name"
      assert solution.description == "some updated description"
      assert solution.comment == "some updated comment"
      assert solution.low_capital_input == 43
      assert solution.middle_capital_input == 43
      assert solution.high_capital_input == 43
      assert solution.low_return == 43
      assert solution.middle_return == 43
      assert solution.high_return == 43
      assert solution.roi_func_id == 43
      assert solution.co2_effect == 43
      assert solution.is_choice == false
      assert solution.deleted_at == ~U[2024-06-07 09:40:00Z]
    end

    test "update_solution/2 with invalid data returns error changeset" do
      solution = solution_fixture()
      assert {:error, %Ecto.Changeset{}} = Cosmos.update_solution(solution, @invalid_attrs)
      assert solution == Cosmos.get_solution!(solution.id)
    end

    test "delete_solution/1 deletes the solution" do
      solution = solution_fixture()
      assert {:ok, %Solution{}} = Cosmos.delete_solution(solution)
      assert_raise Ecto.NoResultsError, fn -> Cosmos.get_solution!(solution.id) end
    end

    test "change_solution/1 returns a solution changeset" do
      solution = solution_fixture()
      assert %Ecto.Changeset{} = Cosmos.change_solution(solution)
    end
  end

  describe "solution_assets" do
    alias Planet.Cosmos.SolutionAsset

    import Planet.CosmosFixtures

    @invalid_attrs %{solution_id: nil, asset_id: nil, deleted_at: nil}

    test "list_solution_assets/0 returns all solution_assets" do
      solution_asset = solution_asset_fixture()
      assert Cosmos.list_solution_assets() == [solution_asset]
    end

    test "get_solution_asset!/1 returns the solution_asset with given id" do
      solution_asset = solution_asset_fixture()
      assert Cosmos.get_solution_asset!(solution_asset.id) == solution_asset
    end

    test "create_solution_asset/1 with valid data creates a solution_asset" do
      valid_attrs = %{solution_id: 42, asset_id: 42, deleted_at: ~U[2024-06-21 08:05:00Z]}

      assert {:ok, %SolutionAsset{} = solution_asset} = Cosmos.create_solution_asset(valid_attrs)
      assert solution_asset.solution_id == 42
      assert solution_asset.asset_id == 42
      assert solution_asset.deleted_at == ~U[2024-06-21 08:05:00Z]
    end

    test "create_solution_asset/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cosmos.create_solution_asset(@invalid_attrs)
    end

    test "update_solution_asset/2 with valid data updates the solution_asset" do
      solution_asset = solution_asset_fixture()
      update_attrs = %{solution_id: 43, asset_id: 43, deleted_at: ~U[2024-06-22 08:05:00Z]}

      assert {:ok, %SolutionAsset{} = solution_asset} = Cosmos.update_solution_asset(solution_asset, update_attrs)
      assert solution_asset.solution_id == 43
      assert solution_asset.asset_id == 43
      assert solution_asset.deleted_at == ~U[2024-06-22 08:05:00Z]
    end

    test "update_solution_asset/2 with invalid data returns error changeset" do
      solution_asset = solution_asset_fixture()
      assert {:error, %Ecto.Changeset{}} = Cosmos.update_solution_asset(solution_asset, @invalid_attrs)
      assert solution_asset == Cosmos.get_solution_asset!(solution_asset.id)
    end

    test "delete_solution_asset/1 deletes the solution_asset" do
      solution_asset = solution_asset_fixture()
      assert {:ok, %SolutionAsset{}} = Cosmos.delete_solution_asset(solution_asset)
      assert_raise Ecto.NoResultsError, fn -> Cosmos.get_solution_asset!(solution_asset.id) end
    end

    test "change_solution_asset/1 returns a solution_asset changeset" do
      solution_asset = solution_asset_fixture()
      assert %Ecto.Changeset{} = Cosmos.change_solution_asset(solution_asset)
    end
  end

  describe "social_issue_solutions" do
    alias Planet.Cosmos.SocialIssueSolution

    import Planet.CosmosFixtures

    @invalid_attrs %{deleted_at: nil}

    test "list_social_issue_solutions/0 returns all social_issue_solutions" do
      social_issue_solution = social_issue_solution_fixture()
      assert Cosmos.list_social_issue_solutions() == [social_issue_solution]
    end

    test "get_social_issue_solution!/1 returns the social_issue_solution with given id" do
      social_issue_solution = social_issue_solution_fixture()
      assert Cosmos.get_social_issue_solution!(social_issue_solution.id) == social_issue_solution
    end

    test "create_social_issue_solution/1 with valid data creates a social_issue_solution" do
      valid_attrs = %{deleted_at: ~U[2024-06-21 09:21:00Z]}

      assert {:ok, %SocialIssueSolution{} = social_issue_solution} = Cosmos.create_social_issue_solution(valid_attrs)
      assert social_issue_solution.deleted_at == ~U[2024-06-21 09:21:00Z]
    end

    test "create_social_issue_solution/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cosmos.create_social_issue_solution(@invalid_attrs)
    end

    test "update_social_issue_solution/2 with valid data updates the social_issue_solution" do
      social_issue_solution = social_issue_solution_fixture()
      update_attrs = %{deleted_at: ~U[2024-06-22 09:21:00Z]}

      assert {:ok, %SocialIssueSolution{} = social_issue_solution} = Cosmos.update_social_issue_solution(social_issue_solution, update_attrs)
      assert social_issue_solution.deleted_at == ~U[2024-06-22 09:21:00Z]
    end

    test "update_social_issue_solution/2 with invalid data returns error changeset" do
      social_issue_solution = social_issue_solution_fixture()
      assert {:error, %Ecto.Changeset{}} = Cosmos.update_social_issue_solution(social_issue_solution, @invalid_attrs)
      assert social_issue_solution == Cosmos.get_social_issue_solution!(social_issue_solution.id)
    end

    test "delete_social_issue_solution/1 deletes the social_issue_solution" do
      social_issue_solution = social_issue_solution_fixture()
      assert {:ok, %SocialIssueSolution{}} = Cosmos.delete_social_issue_solution(social_issue_solution)
      assert_raise Ecto.NoResultsError, fn -> Cosmos.get_social_issue_solution!(social_issue_solution.id) end
    end

    test "change_social_issue_solution/1 returns a social_issue_solution changeset" do
      social_issue_solution = social_issue_solution_fixture()
      assert %Ecto.Changeset{} = Cosmos.change_social_issue_solution(social_issue_solution)
    end
  end

  describe "social_issue_flows" do
    alias Planet.Cosmos.SocialIssueFlow

    import Planet.CosmosFixtures

    @invalid_attrs %{social_issue_id: nil, next_social_issue_id: nil, is_yes: nil, deleted_at: nil}

    test "list_social_issue_flows/0 returns all social_issue_flows" do
      social_issue_flow = social_issue_flow_fixture()
      assert Cosmos.list_social_issue_flows() == [social_issue_flow]
    end

    test "get_social_issue_flow!/1 returns the social_issue_flow with given id" do
      social_issue_flow = social_issue_flow_fixture()
      assert Cosmos.get_social_issue_flow!(social_issue_flow.id) == social_issue_flow
    end

    test "create_social_issue_flow/1 with valid data creates a social_issue_flow" do
      valid_attrs = %{social_issue_id: 42, next_social_issue_id: 42, is_yes: true, deleted_at: ~U[2024-06-21 10:57:00Z]}

      assert {:ok, %SocialIssueFlow{} = social_issue_flow} = Cosmos.create_social_issue_flow(valid_attrs)
      assert social_issue_flow.social_issue_id == 42
      assert social_issue_flow.next_social_issue_id == 42
      assert social_issue_flow.is_yes == true
      assert social_issue_flow.deleted_at == ~U[2024-06-21 10:57:00Z]
    end

    test "create_social_issue_flow/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Cosmos.create_social_issue_flow(@invalid_attrs)
    end

    test "update_social_issue_flow/2 with valid data updates the social_issue_flow" do
      social_issue_flow = social_issue_flow_fixture()
      update_attrs = %{social_issue_id: 43, next_social_issue_id: 43, is_yes: false, deleted_at: ~U[2024-06-22 10:57:00Z]}

      assert {:ok, %SocialIssueFlow{} = social_issue_flow} = Cosmos.update_social_issue_flow(social_issue_flow, update_attrs)
      assert social_issue_flow.social_issue_id == 43
      assert social_issue_flow.next_social_issue_id == 43
      assert social_issue_flow.is_yes == false
      assert social_issue_flow.deleted_at == ~U[2024-06-22 10:57:00Z]
    end

    test "update_social_issue_flow/2 with invalid data returns error changeset" do
      social_issue_flow = social_issue_flow_fixture()
      assert {:error, %Ecto.Changeset{}} = Cosmos.update_social_issue_flow(social_issue_flow, @invalid_attrs)
      assert social_issue_flow == Cosmos.get_social_issue_flow!(social_issue_flow.id)
    end

    test "delete_social_issue_flow/1 deletes the social_issue_flow" do
      social_issue_flow = social_issue_flow_fixture()
      assert {:ok, %SocialIssueFlow{}} = Cosmos.delete_social_issue_flow(social_issue_flow)
      assert_raise Ecto.NoResultsError, fn -> Cosmos.get_social_issue_flow!(social_issue_flow.id) end
    end

    test "change_social_issue_flow/1 returns a social_issue_flow changeset" do
      social_issue_flow = social_issue_flow_fixture()
      assert %Ecto.Changeset{} = Cosmos.change_social_issue_flow(social_issue_flow)
    end
  end
end

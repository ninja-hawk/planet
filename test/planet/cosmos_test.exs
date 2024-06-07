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
end

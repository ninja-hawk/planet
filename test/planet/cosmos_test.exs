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
end

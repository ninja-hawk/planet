defmodule PlanetWeb.AssetControllerTest do
  use PlanetWeb.ConnCase

  import Planet.CosmosFixtures

  @create_attrs %{name: "some name", description: "some description", eco_effect: 42, is_skill: true, is_duplicatable: true, deleted_at: ~U[2024-06-05 07:19:00Z]}
  @update_attrs %{name: "some updated name", description: "some updated description", eco_effect: 43, is_skill: false, is_duplicatable: false, deleted_at: ~U[2024-06-06 07:19:00Z]}
  @invalid_attrs %{name: nil, description: nil, eco_effect: nil, is_skill: nil, is_duplicatable: nil, deleted_at: nil}

  describe "index" do
    test "lists all assets", %{conn: conn} do
      conn = get(conn, ~p"/assets")
      assert html_response(conn, 200) =~ "Listing Assets"
    end
  end

  describe "new asset" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/assets/new")
      assert html_response(conn, 200) =~ "New Asset"
    end
  end

  describe "create asset" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/assets", asset: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/assets/#{id}"

      conn = get(conn, ~p"/assets/#{id}")
      assert html_response(conn, 200) =~ "Asset #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/assets", asset: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Asset"
    end
  end

  describe "edit asset" do
    setup [:create_asset]

    test "renders form for editing chosen asset", %{conn: conn, asset: asset} do
      conn = get(conn, ~p"/assets/#{asset}/edit")
      assert html_response(conn, 200) =~ "Edit Asset"
    end
  end

  describe "update asset" do
    setup [:create_asset]

    test "redirects when data is valid", %{conn: conn, asset: asset} do
      conn = put(conn, ~p"/assets/#{asset}", asset: @update_attrs)
      assert redirected_to(conn) == ~p"/assets/#{asset}"

      conn = get(conn, ~p"/assets/#{asset}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, asset: asset} do
      conn = put(conn, ~p"/assets/#{asset}", asset: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Asset"
    end
  end

  describe "delete asset" do
    setup [:create_asset]

    test "deletes chosen asset", %{conn: conn, asset: asset} do
      conn = delete(conn, ~p"/assets/#{asset}")
      assert redirected_to(conn) == ~p"/assets"

      assert_error_sent 404, fn ->
        get(conn, ~p"/assets/#{asset}")
      end
    end
  end

  defp create_asset(_) do
    asset = asset_fixture()
    %{asset: asset}
  end
end

defmodule PlanetWeb.SolutionAssetControllerTest do
  use PlanetWeb.ConnCase

  import Planet.CosmosFixtures

  @create_attrs %{solution_id: 42, asset_id: 42, deleted_at: ~U[2024-06-21 08:05:00Z]}
  @update_attrs %{solution_id: 43, asset_id: 43, deleted_at: ~U[2024-06-22 08:05:00Z]}
  @invalid_attrs %{solution_id: nil, asset_id: nil, deleted_at: nil}

  describe "index" do
    test "lists all solution_assets", %{conn: conn} do
      conn = get(conn, ~p"/solution_assets")
      assert html_response(conn, 200) =~ "Listing Solution assets"
    end
  end

  describe "new solution_asset" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/solution_assets/new")
      assert html_response(conn, 200) =~ "New Solution asset"
    end
  end

  describe "create solution_asset" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/solution_assets", solution_asset: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/solution_assets/#{id}"

      conn = get(conn, ~p"/solution_assets/#{id}")
      assert html_response(conn, 200) =~ "Solution asset #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/solution_assets", solution_asset: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Solution asset"
    end
  end

  describe "edit solution_asset" do
    setup [:create_solution_asset]

    test "renders form for editing chosen solution_asset", %{conn: conn, solution_asset: solution_asset} do
      conn = get(conn, ~p"/solution_assets/#{solution_asset}/edit")
      assert html_response(conn, 200) =~ "Edit Solution asset"
    end
  end

  describe "update solution_asset" do
    setup [:create_solution_asset]

    test "redirects when data is valid", %{conn: conn, solution_asset: solution_asset} do
      conn = put(conn, ~p"/solution_assets/#{solution_asset}", solution_asset: @update_attrs)
      assert redirected_to(conn) == ~p"/solution_assets/#{solution_asset}"

      conn = get(conn, ~p"/solution_assets/#{solution_asset}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, solution_asset: solution_asset} do
      conn = put(conn, ~p"/solution_assets/#{solution_asset}", solution_asset: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Solution asset"
    end
  end

  describe "delete solution_asset" do
    setup [:create_solution_asset]

    test "deletes chosen solution_asset", %{conn: conn, solution_asset: solution_asset} do
      conn = delete(conn, ~p"/solution_assets/#{solution_asset}")
      assert redirected_to(conn) == ~p"/solution_assets"

      assert_error_sent 404, fn ->
        get(conn, ~p"/solution_assets/#{solution_asset}")
      end
    end
  end

  defp create_solution_asset(_) do
    solution_asset = solution_asset_fixture()
    %{solution_asset: solution_asset}
  end
end

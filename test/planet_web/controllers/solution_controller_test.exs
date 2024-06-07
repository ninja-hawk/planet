defmodule PlanetWeb.SolutionControllerTest do
  use PlanetWeb.ConnCase

  import Planet.CosmosFixtures

  @create_attrs %{name: "some name", description: "some description", comment: "some comment", low_capital_input: 42, middle_capital_input: 42, high_capital_input: 42, low_return: 42, middle_return: 42, high_return: 42, roi_func_id: 42, co2_effect: 42, is_choice: true, deleted_at: ~U[2024-06-06 09:40:00Z]}
  @update_attrs %{name: "some updated name", description: "some updated description", comment: "some updated comment", low_capital_input: 43, middle_capital_input: 43, high_capital_input: 43, low_return: 43, middle_return: 43, high_return: 43, roi_func_id: 43, co2_effect: 43, is_choice: false, deleted_at: ~U[2024-06-07 09:40:00Z]}
  @invalid_attrs %{name: nil, description: nil, comment: nil, low_capital_input: nil, middle_capital_input: nil, high_capital_input: nil, low_return: nil, middle_return: nil, high_return: nil, roi_func_id: nil, co2_effect: nil, is_choice: nil, deleted_at: nil}

  describe "index" do
    test "lists all solutions", %{conn: conn} do
      conn = get(conn, ~p"/solutions")
      assert html_response(conn, 200) =~ "Listing Solutions"
    end
  end

  describe "new solution" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/solutions/new")
      assert html_response(conn, 200) =~ "New Solution"
    end
  end

  describe "create solution" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/solutions", solution: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/solutions/#{id}"

      conn = get(conn, ~p"/solutions/#{id}")
      assert html_response(conn, 200) =~ "Solution #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/solutions", solution: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Solution"
    end
  end

  describe "edit solution" do
    setup [:create_solution]

    test "renders form for editing chosen solution", %{conn: conn, solution: solution} do
      conn = get(conn, ~p"/solutions/#{solution}/edit")
      assert html_response(conn, 200) =~ "Edit Solution"
    end
  end

  describe "update solution" do
    setup [:create_solution]

    test "redirects when data is valid", %{conn: conn, solution: solution} do
      conn = put(conn, ~p"/solutions/#{solution}", solution: @update_attrs)
      assert redirected_to(conn) == ~p"/solutions/#{solution}"

      conn = get(conn, ~p"/solutions/#{solution}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, solution: solution} do
      conn = put(conn, ~p"/solutions/#{solution}", solution: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Solution"
    end
  end

  describe "delete solution" do
    setup [:create_solution]

    test "deletes chosen solution", %{conn: conn, solution: solution} do
      conn = delete(conn, ~p"/solutions/#{solution}")
      assert redirected_to(conn) == ~p"/solutions"

      assert_error_sent 404, fn ->
        get(conn, ~p"/solutions/#{solution}")
      end
    end
  end

  defp create_solution(_) do
    solution = solution_fixture()
    %{solution: solution}
  end
end

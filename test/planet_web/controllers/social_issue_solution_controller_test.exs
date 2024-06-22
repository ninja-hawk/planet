defmodule PlanetWeb.SocialIssueSolutionControllerTest do
  use PlanetWeb.ConnCase

  import Planet.CosmosFixtures

  @create_attrs %{deleted_at: ~U[2024-06-21 09:21:00Z]}
  @update_attrs %{deleted_at: ~U[2024-06-22 09:21:00Z]}
  @invalid_attrs %{deleted_at: nil}

  describe "index" do
    test "lists all social_issue_solutions", %{conn: conn} do
      conn = get(conn, ~p"/social_issue_solutions")
      assert html_response(conn, 200) =~ "Listing Social issue solutions"
    end
  end

  describe "new social_issue_solution" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/social_issue_solutions/new")
      assert html_response(conn, 200) =~ "New Social issue solution"
    end
  end

  describe "create social_issue_solution" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/social_issue_solutions", social_issue_solution: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/social_issue_solutions/#{id}"

      conn = get(conn, ~p"/social_issue_solutions/#{id}")
      assert html_response(conn, 200) =~ "Social issue solution #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/social_issue_solutions", social_issue_solution: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Social issue solution"
    end
  end

  describe "edit social_issue_solution" do
    setup [:create_social_issue_solution]

    test "renders form for editing chosen social_issue_solution", %{conn: conn, social_issue_solution: social_issue_solution} do
      conn = get(conn, ~p"/social_issue_solutions/#{social_issue_solution}/edit")
      assert html_response(conn, 200) =~ "Edit Social issue solution"
    end
  end

  describe "update social_issue_solution" do
    setup [:create_social_issue_solution]

    test "redirects when data is valid", %{conn: conn, social_issue_solution: social_issue_solution} do
      conn = put(conn, ~p"/social_issue_solutions/#{social_issue_solution}", social_issue_solution: @update_attrs)
      assert redirected_to(conn) == ~p"/social_issue_solutions/#{social_issue_solution}"

      conn = get(conn, ~p"/social_issue_solutions/#{social_issue_solution}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, social_issue_solution: social_issue_solution} do
      conn = put(conn, ~p"/social_issue_solutions/#{social_issue_solution}", social_issue_solution: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Social issue solution"
    end
  end

  describe "delete social_issue_solution" do
    setup [:create_social_issue_solution]

    test "deletes chosen social_issue_solution", %{conn: conn, social_issue_solution: social_issue_solution} do
      conn = delete(conn, ~p"/social_issue_solutions/#{social_issue_solution}")
      assert redirected_to(conn) == ~p"/social_issue_solutions"

      assert_error_sent 404, fn ->
        get(conn, ~p"/social_issue_solutions/#{social_issue_solution}")
      end
    end
  end

  defp create_social_issue_solution(_) do
    social_issue_solution = social_issue_solution_fixture()
    %{social_issue_solution: social_issue_solution}
  end
end

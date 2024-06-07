defmodule PlanetWeb.SocialIssueControllerTest do
  use PlanetWeb.ConnCase

  import Planet.CosmosFixtures

  @create_attrs %{name: "some name", situation: "some situation", possible_solution: "some possible_solution", youth_effect: 42, economic_growth_effect: 42, co2_effect: 42, is_question: true, is_last: true, tip: "some tip", deleted_at: ~U[2024-06-06 06:53:00Z]}
  @update_attrs %{name: "some updated name", situation: "some updated situation", possible_solution: "some updated possible_solution", youth_effect: 43, economic_growth_effect: 43, co2_effect: 43, is_question: false, is_last: false, tip: "some updated tip", deleted_at: ~U[2024-06-07 06:53:00Z]}
  @invalid_attrs %{name: nil, situation: nil, possible_solution: nil, youth_effect: nil, economic_growth_effect: nil, co2_effect: nil, is_question: nil, is_last: nil, tip: nil, deleted_at: nil}

  describe "index" do
    test "lists all social_issues", %{conn: conn} do
      conn = get(conn, ~p"/social_issues")
      assert html_response(conn, 200) =~ "Listing Social issues"
    end
  end

  describe "new social_issue" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/social_issues/new")
      assert html_response(conn, 200) =~ "New Social issue"
    end
  end

  describe "create social_issue" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/social_issues", social_issue: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/social_issues/#{id}"

      conn = get(conn, ~p"/social_issues/#{id}")
      assert html_response(conn, 200) =~ "Social issue #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/social_issues", social_issue: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Social issue"
    end
  end

  describe "edit social_issue" do
    setup [:create_social_issue]

    test "renders form for editing chosen social_issue", %{conn: conn, social_issue: social_issue} do
      conn = get(conn, ~p"/social_issues/#{social_issue}/edit")
      assert html_response(conn, 200) =~ "Edit Social issue"
    end
  end

  describe "update social_issue" do
    setup [:create_social_issue]

    test "redirects when data is valid", %{conn: conn, social_issue: social_issue} do
      conn = put(conn, ~p"/social_issues/#{social_issue}", social_issue: @update_attrs)
      assert redirected_to(conn) == ~p"/social_issues/#{social_issue}"

      conn = get(conn, ~p"/social_issues/#{social_issue}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, social_issue: social_issue} do
      conn = put(conn, ~p"/social_issues/#{social_issue}", social_issue: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Social issue"
    end
  end

  describe "delete social_issue" do
    setup [:create_social_issue]

    test "deletes chosen social_issue", %{conn: conn, social_issue: social_issue} do
      conn = delete(conn, ~p"/social_issues/#{social_issue}")
      assert redirected_to(conn) == ~p"/social_issues"

      assert_error_sent 404, fn ->
        get(conn, ~p"/social_issues/#{social_issue}")
      end
    end
  end

  defp create_social_issue(_) do
    social_issue = social_issue_fixture()
    %{social_issue: social_issue}
  end
end

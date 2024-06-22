defmodule PlanetWeb.SocialIssueFlowControllerTest do
  use PlanetWeb.ConnCase

  import Planet.CosmosFixtures

  @create_attrs %{social_issue_id: 42, next_social_issue_id: 42, is_yes: true, deleted_at: ~U[2024-06-21 10:57:00Z]}
  @update_attrs %{social_issue_id: 43, next_social_issue_id: 43, is_yes: false, deleted_at: ~U[2024-06-22 10:57:00Z]}
  @invalid_attrs %{social_issue_id: nil, next_social_issue_id: nil, is_yes: nil, deleted_at: nil}

  describe "index" do
    test "lists all social_issue_flows", %{conn: conn} do
      conn = get(conn, ~p"/social_issue_flows")
      assert html_response(conn, 200) =~ "Listing Social issue flows"
    end
  end

  describe "new social_issue_flow" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/social_issue_flows/new")
      assert html_response(conn, 200) =~ "New Social issue flow"
    end
  end

  describe "create social_issue_flow" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/social_issue_flows", social_issue_flow: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/social_issue_flows/#{id}"

      conn = get(conn, ~p"/social_issue_flows/#{id}")
      assert html_response(conn, 200) =~ "Social issue flow #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/social_issue_flows", social_issue_flow: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Social issue flow"
    end
  end

  describe "edit social_issue_flow" do
    setup [:create_social_issue_flow]

    test "renders form for editing chosen social_issue_flow", %{conn: conn, social_issue_flow: social_issue_flow} do
      conn = get(conn, ~p"/social_issue_flows/#{social_issue_flow}/edit")
      assert html_response(conn, 200) =~ "Edit Social issue flow"
    end
  end

  describe "update social_issue_flow" do
    setup [:create_social_issue_flow]

    test "redirects when data is valid", %{conn: conn, social_issue_flow: social_issue_flow} do
      conn = put(conn, ~p"/social_issue_flows/#{social_issue_flow}", social_issue_flow: @update_attrs)
      assert redirected_to(conn) == ~p"/social_issue_flows/#{social_issue_flow}"

      conn = get(conn, ~p"/social_issue_flows/#{social_issue_flow}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, social_issue_flow: social_issue_flow} do
      conn = put(conn, ~p"/social_issue_flows/#{social_issue_flow}", social_issue_flow: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Social issue flow"
    end
  end

  describe "delete social_issue_flow" do
    setup [:create_social_issue_flow]

    test "deletes chosen social_issue_flow", %{conn: conn, social_issue_flow: social_issue_flow} do
      conn = delete(conn, ~p"/social_issue_flows/#{social_issue_flow}")
      assert redirected_to(conn) == ~p"/social_issue_flows"

      assert_error_sent 404, fn ->
        get(conn, ~p"/social_issue_flows/#{social_issue_flow}")
      end
    end
  end

  defp create_social_issue_flow(_) do
    social_issue_flow = social_issue_flow_fixture()
    %{social_issue_flow: social_issue_flow}
  end
end

defmodule PlanetWeb.CheckAssetController do
  use PlanetWeb, :controller

  alias Planet.Cosmos

  def index(conn, _params) do
    assets = Cosmos.list_assets()
    social_issues = Cosmos.list_social_issues()
    action = "/check_asset/check"
    render(conn, :index, assets: assets, social_issues: social_issues, action: action)
  end

  def show(conn, %{"social_issue_id" => social_issue_id, "asset_1" => asset_1, "asset_2" => asset_2, "num_of_youth_pop" => num_of_youth_pop}) do
    social_issue = Cosmos.get_social_issue!(social_issue_id)
    conn
    |> put_flash(:info, "Correct!")
    |> render(:show, social_issue_id: social_issue_id, social_issue: social_issue, asset_1: asset_1, asset_2: asset_2, num_of_youth_pop: num_of_youth_pop)
  end

  def check(conn, %{"social_issue_id" => social_issue_id, "asset_1" => asset_1, "asset_2" => asset_2, "num_of_youth_pop" => num_of_youth_pop}) do
    social_issue = Cosmos.get_social_issue!(social_issue_id)
    Enum.each(social_issue.solutions, fn solution ->
      IO.inspect(solution)
    end)
    IO.puts("Received params: #{social_issue.situation}")
    render(conn, :show, social_issue_id: social_issue_id, social_issue: social_issue, asset_1: asset_1, asset_2: asset_2, num_of_youth_pop: num_of_youth_pop)
  end
end

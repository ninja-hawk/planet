defmodule PlanetWeb.CheckAssetController do
  use PlanetWeb, :controller

  alias Planet.Cosmos

  def index(conn, _params) do
    assets = Cosmos.list_assets()
    social_issues = Cosmos.list_social_issues()
    action = "/check_asset/check"
    render(conn, :index, assets: assets, social_issues: social_issues, action: action)
  end

  def show(conn, %{"social_issue_id" => social_issue_id, "assets" => assets, "num_of_youth_pop" => num_of_youth_pop}) do
    conn
    |> put_flash(:info, "Correct!")
    |> render(:show, social_issue_id: social_issue_id, assets: assets, num_of_youth_pop: num_of_youth_pop)
  end

  def check(conn, %{"social_issue_id" => social_issue_id, "assets" => assets, "num_of_youth_pop" => num_of_youth_pop}) do
    render(conn, :show, social_issue_id: social_issue_id, assets: assets, num_of_youth_pop: num_of_youth_pop)
  end
end

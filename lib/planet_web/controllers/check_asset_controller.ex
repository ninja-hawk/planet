defmodule PlanetWeb.CheckAssetController do
  use PlanetWeb, :controller

  alias Planet.Cosmos

  def index(conn, _params) do
    assets = Cosmos.list_assets()
    social_issues = Cosmos.list_social_issues()
    render(conn, :index, assets: assets, social_issues: social_issues)
  end

  def show(conn, _params) do
    conn
    |> put_flash(:info, "Asset created successfully.")
    render(conn, :show)
  end
end

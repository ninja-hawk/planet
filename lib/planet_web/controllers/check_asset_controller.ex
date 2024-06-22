defmodule PlanetWeb.CheckAssetController do
  use PlanetWeb, :controller

  alias Planet.Cosmos
  alias Planet.Cosmos.Asset

  def index(conn, _params) do
    assets = Cosmos.list_assets()
    render(conn, :index, assets: assets)
  end

  def show(conn, %{"messenger" => messenger}) do
    render(conn, :show, messenger: messenger)
  end
end

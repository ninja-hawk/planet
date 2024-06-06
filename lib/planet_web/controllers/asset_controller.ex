defmodule PlanetWeb.AssetController do
  use PlanetWeb, :controller

  alias Planet.Cosmos
  alias Planet.Cosmos.Asset

  plug PlanetWeb.Plugs.RequireAdmin when action in [:new, :create, :edit, :update, :delete]

  def index(conn, _params) do
    assets = Cosmos.list_assets()
    render(conn, :index, assets: assets)
  end

  def new(conn, _params) do
    changeset = Cosmos.change_asset(%Asset{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"asset" => asset_params}) do
    case Cosmos.create_asset(asset_params) do
      {:ok, asset} ->
        conn
        |> put_flash(:info, "Asset created successfully.")
        |> redirect(to: ~p"/assets/#{asset}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    asset = Cosmos.get_asset!(id)
    render(conn, :show, asset: asset)
  end

  def edit(conn, %{"id" => id}) do
    asset = Cosmos.get_asset!(id)
    changeset = Cosmos.change_asset(asset)
    render(conn, :edit, asset: asset, changeset: changeset)
  end

  def update(conn, %{"id" => id, "asset" => asset_params}) do
    asset = Cosmos.get_asset!(id)

    case Cosmos.update_asset(asset, asset_params) do
      {:ok, asset} ->
        conn
        |> put_flash(:info, "Asset updated successfully.")
        |> redirect(to: ~p"/assets/#{asset}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, asset: asset, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    asset = Cosmos.get_asset!(id)
    {:ok, _asset} = Cosmos.delete_asset(asset)

    conn
    |> put_flash(:info, "Asset deleted successfully.")
    |> redirect(to: ~p"/assets")
  end
end

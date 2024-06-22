defmodule PlanetWeb.SolutionAssetController do
  use PlanetWeb, :controller

  alias Planet.Cosmos
  alias Planet.Cosmos.SolutionAsset

  def index(conn, _params) do
    solution_assets = Cosmos.list_solution_assets()
    render(conn, :index, solution_assets: solution_assets)
  end

  def new(conn, _params) do
    changeset = Cosmos.change_solution_asset(%SolutionAsset{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"solution_asset" => solution_asset_params}) do
    case Cosmos.create_solution_asset(solution_asset_params) do
      {:ok, solution_asset} ->
        conn
        |> put_flash(:info, "Solution asset created successfully.")
        |> redirect(to: ~p"/solution_assets/#{solution_asset}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    solution_asset = Cosmos.get_solution_asset!(id)
    render(conn, :show, solution_asset: solution_asset)
  end

  def edit(conn, %{"id" => id}) do
    solution_asset = Cosmos.get_solution_asset!(id)
    changeset = Cosmos.change_solution_asset(solution_asset)
    render(conn, :edit, solution_asset: solution_asset, changeset: changeset)
  end

  def update(conn, %{"id" => id, "solution_asset" => solution_asset_params}) do
    solution_asset = Cosmos.get_solution_asset!(id)

    case Cosmos.update_solution_asset(solution_asset, solution_asset_params) do
      {:ok, solution_asset} ->
        conn
        |> put_flash(:info, "Solution asset updated successfully.")
        |> redirect(to: ~p"/solution_assets/#{solution_asset}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, solution_asset: solution_asset, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    solution_asset = Cosmos.get_solution_asset!(id)
    {:ok, _solution_asset} = Cosmos.delete_solution_asset(solution_asset)

    conn
    |> put_flash(:info, "Solution asset deleted successfully.")
    |> redirect(to: ~p"/solution_assets")
  end
end

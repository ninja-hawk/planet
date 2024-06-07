defmodule PlanetWeb.SolutionController do
  use PlanetWeb, :controller

  alias Planet.Cosmos
  alias Planet.Cosmos.Solution

  def index(conn, _params) do
    solutions = Cosmos.list_solutions()
    render(conn, :index, solutions: solutions)
  end

  def new(conn, _params) do
    changeset = Cosmos.change_solution(%Solution{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"solution" => solution_params}) do
    case Cosmos.create_solution(solution_params) do
      {:ok, solution} ->
        conn
        |> put_flash(:info, "Solution created successfully.")
        |> redirect(to: ~p"/solutions/#{solution}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    solution = Cosmos.get_solution!(id)
    render(conn, :show, solution: solution)
  end

  def edit(conn, %{"id" => id}) do
    solution = Cosmos.get_solution!(id)
    changeset = Cosmos.change_solution(solution)
    render(conn, :edit, solution: solution, changeset: changeset)
  end

  def update(conn, %{"id" => id, "solution" => solution_params}) do
    solution = Cosmos.get_solution!(id)

    case Cosmos.update_solution(solution, solution_params) do
      {:ok, solution} ->
        conn
        |> put_flash(:info, "Solution updated successfully.")
        |> redirect(to: ~p"/solutions/#{solution}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, solution: solution, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    solution = Cosmos.get_solution!(id)
    {:ok, _solution} = Cosmos.delete_solution(solution)

    conn
    |> put_flash(:info, "Solution deleted successfully.")
    |> redirect(to: ~p"/solutions")
  end
end

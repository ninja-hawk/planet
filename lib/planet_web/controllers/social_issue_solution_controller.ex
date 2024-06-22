defmodule PlanetWeb.SocialIssueSolutionController do
  use PlanetWeb, :controller

  alias Planet.Cosmos
  alias Planet.Cosmos.SocialIssueSolution

  def index(conn, _params) do
    social_issue_solutions = Cosmos.list_social_issue_solutions()
    render(conn, :index, social_issue_solutions: social_issue_solutions)
  end

  def new(conn, _params) do
    changeset = Cosmos.change_social_issue_solution(%SocialIssueSolution{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"social_issue_solution" => social_issue_solution_params}) do
    case Cosmos.create_social_issue_solution(social_issue_solution_params) do
      {:ok, social_issue_solution} ->
        conn
        |> put_flash(:info, "Social issue solution created successfully.")
        |> redirect(to: ~p"/social_issue_solutions/#{social_issue_solution}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    social_issue_solution = Cosmos.get_social_issue_solution!(id)
    render(conn, :show, social_issue_solution: social_issue_solution)
  end

  def edit(conn, %{"id" => id}) do
    social_issue_solution = Cosmos.get_social_issue_solution!(id)
    changeset = Cosmos.change_social_issue_solution(social_issue_solution)
    render(conn, :edit, social_issue_solution: social_issue_solution, changeset: changeset)
  end

  def update(conn, %{"id" => id, "social_issue_solution" => social_issue_solution_params}) do
    social_issue_solution = Cosmos.get_social_issue_solution!(id)

    case Cosmos.update_social_issue_solution(social_issue_solution, social_issue_solution_params) do
      {:ok, social_issue_solution} ->
        conn
        |> put_flash(:info, "Social issue solution updated successfully.")
        |> redirect(to: ~p"/social_issue_solutions/#{social_issue_solution}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, social_issue_solution: social_issue_solution, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    social_issue_solution = Cosmos.get_social_issue_solution!(id)
    {:ok, _social_issue_solution} = Cosmos.delete_social_issue_solution(social_issue_solution)

    conn
    |> put_flash(:info, "Social issue solution deleted successfully.")
    |> redirect(to: ~p"/social_issue_solutions")
  end
end

defmodule PlanetWeb.SocialIssueController do
  use PlanetWeb, :controller

  alias Planet.Cosmos
  alias Planet.Cosmos.SocialIssue

  def index(conn, _params) do
    social_issues = Cosmos.list_social_issues()
    render(conn, :index, social_issues: social_issues)
  end

  def new(conn, _params) do
    changeset = Cosmos.change_social_issue(%SocialIssue{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"social_issue" => social_issue_params}) do
    case Cosmos.create_social_issue(social_issue_params) do
      {:ok, social_issue} ->
        conn
        |> put_flash(:info, "Social issue created successfully.")
        |> redirect(to: ~p"/social_issues/#{social_issue}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    social_issue = Cosmos.get_social_issue!(id)
    render(conn, :show, social_issue: social_issue)
  end

  def edit(conn, %{"id" => id}) do
    social_issue = Cosmos.get_social_issue!(id)
    changeset = Cosmos.change_social_issue(social_issue)
    render(conn, :edit, social_issue: social_issue, changeset: changeset)
  end

  def update(conn, %{"id" => id, "social_issue" => social_issue_params}) do
    social_issue = Cosmos.get_social_issue!(id)

    case Cosmos.update_social_issue(social_issue, social_issue_params) do
      {:ok, social_issue} ->
        conn
        |> put_flash(:info, "Social issue updated successfully.")
        |> redirect(to: ~p"/social_issues/#{social_issue}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, social_issue: social_issue, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    social_issue = Cosmos.get_social_issue!(id)
    {:ok, _social_issue} = Cosmos.delete_social_issue(social_issue)

    conn
    |> put_flash(:info, "Social issue deleted successfully.")
    |> redirect(to: ~p"/social_issues")
  end
end

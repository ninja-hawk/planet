defmodule PlanetWeb.SocialIssueFlowController do
  use PlanetWeb, :controller

  alias Planet.Cosmos
  alias Planet.Cosmos.SocialIssueFlow

  def index(conn, _params) do
    social_issue_flows = Cosmos.list_social_issue_flows()
    render(conn, :index, social_issue_flows: social_issue_flows)
  end

  def new(conn, _params) do
    changeset = Cosmos.change_social_issue_flow(%SocialIssueFlow{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"social_issue_flow" => social_issue_flow_params}) do
    case Cosmos.create_social_issue_flow(social_issue_flow_params) do
      {:ok, social_issue_flow} ->
        conn
        |> put_flash(:info, "Social issue flow created successfully.")
        |> redirect(to: ~p"/social_issue_flows/#{social_issue_flow}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    social_issue_flow = Cosmos.get_social_issue_flow!(id)
    render(conn, :show, social_issue_flow: social_issue_flow)
  end

  def edit(conn, %{"id" => id}) do
    social_issue_flow = Cosmos.get_social_issue_flow!(id)
    changeset = Cosmos.change_social_issue_flow(social_issue_flow)
    render(conn, :edit, social_issue_flow: social_issue_flow, changeset: changeset)
  end

  def update(conn, %{"id" => id, "social_issue_flow" => social_issue_flow_params}) do
    social_issue_flow = Cosmos.get_social_issue_flow!(id)

    case Cosmos.update_social_issue_flow(social_issue_flow, social_issue_flow_params) do
      {:ok, social_issue_flow} ->
        conn
        |> put_flash(:info, "Social issue flow updated successfully.")
        |> redirect(to: ~p"/social_issue_flows/#{social_issue_flow}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, social_issue_flow: social_issue_flow, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    social_issue_flow = Cosmos.get_social_issue_flow!(id)
    {:ok, _social_issue_flow} = Cosmos.delete_social_issue_flow(social_issue_flow)

    conn
    |> put_flash(:info, "Social issue flow deleted successfully.")
    |> redirect(to: ~p"/social_issue_flows")
  end
end

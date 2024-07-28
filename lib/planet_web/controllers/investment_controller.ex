defmodule PlanetWeb.InvestmentController do
  use PlanetWeb, :controller

  alias Planet.Cosmos

  def index(conn, _params) do
    social_issues = Cosmos.list_social_issues()
    solutions = Cosmos.list_solutions()
    action = "investment/next_social_issue"

    render(conn, :index, solutions: solutions, social_issues: social_issues, action: action)
  end

  def find(conn, %{"social_issue_id" => social_issue_id}) do
    social_issue = Cosmos.get_social_issue!(social_issue_id)
    IO.inspect(social_issue.social_issue_flows, charlists: :as_list)
    render(conn, :show, social_issue: social_issue)
  end


end

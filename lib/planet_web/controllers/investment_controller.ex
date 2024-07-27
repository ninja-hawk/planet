defmodule PlanetWeb.InvestmentController do
  use PlanetWeb, :controller

  alias Planet.Cosmos

  def index(conn, _params) do
    solutions = Cosmos.list_solutions()
    render(conn, :index, solutions: solutions)
  end


end

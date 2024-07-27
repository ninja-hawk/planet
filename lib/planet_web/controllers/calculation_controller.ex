defmodule PlanetWeb.CalculationController do
  use PlanetWeb, :controller

  alias Planet.Cosmos

  def index(conn, _params) do
    assets = Cosmos.list_assets()
    social_issues = Cosmos.list_social_issues()
    solutions = Cosmos.list_solutions()
    action = "/calculation/result"
    render(conn, :index, assets: assets, social_issues: social_issues, solutions: solutions, action: action)
  end

  def calculate(conn, %{
    "nation_type" => nation_type,
    "turn_number" => turn_number,
    "social_issues" => social_issues,
    "solutions" => solutions,
    "sum_of_roi" => sum_of_roi,
    "num_of_youth_pop" => num_of_youth_pop,
    "num_of_educated_pop" => num_of_educated_pop
    }) do

    file_path = Path.join(:code.priv_dir(:planet), "static/data/economic_growth.json")
    economic_growth = File.read!(file_path) |> Jason.decode!()

    y_n = economic_growth[nation_type][turn_number]
    IO.inspect("y_n: #{y_n}")

    p = String.to_integer(num_of_youth_pop)
    l = String.to_integer(num_of_educated_pop)
    IO.inspect("p: #{p}")
    IO.inspect("l: #{l}")

    y_s = String.to_integer(sum_of_roi)
    IO.inspect("y_s: #{y_s}")

    initial_social_issue_related = %{
      y_s: 0,
      m_minus: 0,
      c: 0,
      e_i: 0,
      e_s: 0
    }

    initial_solution_related = %{
      y_s: 0,
      e_s: 0
    }

    social_issue_related = Enum.reduce(social_issues, initial_social_issue_related, fn social_issue_id, acc ->
      id = String.to_integer(social_issue_id)

      case Cosmos.try_social_issue(id) do
        {:ok, social_issue} ->
          %{
            acc |
            m_minus: acc.m_minus + social_issue.youth_effect,
            c: acc.c + social_issue.economic_growth_effect,
            e_i: acc.e_i + social_issue.co2_effect
          }
        {:error, :not_found} ->
          acc
      end
    end)

    IO.inspect(social_issue_related.m_minus, label: "Total m_minus")
    IO.inspect(social_issue_related.c, label: "Total c")
    IO.inspect(social_issue_related.e_i, label: "Total e_i")

    solution_related = Enum.reduce(solutions, initial_solution_related, fn solution_id, acc ->
      id = String.to_integer(solution_id)

      case Cosmos.try_solution(id) do
        {:ok, solution} ->
          %{
            acc |
            e_s: acc.e_s + solution.co2_effect
          }
        {:error, :not_found} ->
          acc
      end
    end)

    IO.inspect(solution_related.y_s, label: "Total y_s")
    IO.inspect(solution_related.e_s, label: "Total e_s")


    total_economic_growth = (y_n + y_s + p*(3 + social_issue_related.m_minus) + 4*l) + social_issue_related.c - (4*(social_issue_related.e_i + solution_related.e_s))

    conn
    |> put_flash(:info, "Correct!")
    |> render(:show,
    nation_type: nation_type,
    turn_number: turn_number,
    social_issues: social_issues,
    solutions: solutions,
    num_of_youth_pop: num_of_youth_pop,
    num_of_educated_pop: num_of_educated_pop,
    total_economic_growth: total_economic_growth,
    y_n: y_n,
    y_s: y_s,
    p: p,
    m_minus: social_issue_related.m_minus,
    c: social_issue_related.c,
    e_i: social_issue_related.e_i,
    e_s: solution_related.e_s
    )

  end

end

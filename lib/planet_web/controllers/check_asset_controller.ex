defmodule PlanetWeb.CheckAssetController do
  use PlanetWeb, :controller

  alias Planet.Cosmos

  def index(conn, _params) do
    assets = Cosmos.list_assets()
    social_issues = Cosmos.list_social_issues()
    action = "/check_asset/check"
    render(conn, :index, assets: assets, social_issues: social_issues, action: action)
  end

  def check(conn, %{"social_issue_id" => social_issue_id, "assets" => assets, "num_of_youth_pop" => num_of_youth_pop}) do
    social_issue = Cosmos.get_social_issue!(social_issue_id)

    # IO.puts("Selected Raw Assets:")
    # IO.inspect(assets)
    # IO.puts("Youth")
    # IO.inspect(num_of_youth_pop)

    assets = assets
    |> Enum.filter(&(&1 != "")) # Ignore ""
    |> Enum.map(&String.to_integer/1) # Convert into integer

    assets = if String.to_integer(num_of_youth_pop) >= 3 do
      assets ++ [11] # MAGIC NUMBER Asset.id = 11 = Youth Pop*3
    else
      assets
    end

    # IO.puts("Selected Assets:")
    # IO.inspect(assets)
    matched_solutions = Enum.filter(social_issue.solutions, fn solution ->
      solution_assets_ids = Enum.map(solution.assets, &(&1.id))
      # IO.puts("Solution Assets:")
      # IO.inspect(solution_assets_ids)
      case assets do
        [a1, a2, a3] -> (a1 in solution_assets_ids and a2 in solution_assets_ids) or (a2 in solution_assets_ids and a3 in solution_assets_ids) or (a1 in solution_assets_ids and a3 in solution_assets_ids)
        or (a1 in solution_assets_ids and length(solution_assets_ids) == 1) or ( a2 in solution_assets_ids and length(solution_assets_ids) == 1) or ( a3 in solution_assets_ids and length(solution_assets_ids) == 1)
        [a1, a2] -> (a1 in solution_assets_ids and a2 in solution_assets_ids) or (a1 in solution_assets_ids and length(solution_assets_ids) == 1) or ( a2 in solution_assets_ids and length(solution_assets_ids) == 1)
        [a1] -> a1 in solution_assets_ids and length(solution_assets_ids) == 1
        _ -> false
      end
    end)


    match_solution = matched_solutions
    |> Enum.max_by(&length(&1.assets), fn -> nil end)
    # IO.puts("Matched Solution:")
    # IO.inspect(match_solution)

    case match_solution do
      nil -> conn |> put_flash(:error, "No matching solutions found.") |> redirect(to: "/")
      _ -> conn |> put_flash(:info, "Correct!") |> render(:show, social_issue_name: social_issue.name, solution: match_solution, assets: assets, num_of_youth_pop: num_of_youth_pop)
    end
  end
end

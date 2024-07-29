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
    IO.inspect(assets, charlists: :as_list)
    # IO.puts("Youth")
    # IO.inspect(num_of_youth_pop)

    assets = assets
    |> Enum.filter(&(&1 != "")) # Ignore ""
    |> Enum.map(&String.to_integer/1) # Convert into integer
    |> remove_zeros()


    enough_youth_pop = String.to_integer(num_of_youth_pop) >= 3
    IO.inspect("flag: #{enough_youth_pop}")
    assets = if enough_youth_pop do
      assets ++ [11] # MAGIC NUMBER Asset.id = 11 = Youth Pop*3
    else
      assets
    end

    IO.puts("Selected Assets:")
    IO.inspect(assets, charlists: :as_list)

    matched_solutions =
        Enum.filter(social_issue.solutions, fn solution ->
          solution_assets_ids = Enum.map(solution.assets, &(&1.id))
          # IO.puts("Solution Assets:")
          # IO.inspect(solution_assets_ids, charlists: :as_list)
          case assets do
            [a1, a2, a3] -> (a1 in solution_assets_ids and a2 in solution_assets_ids) or (a2 in solution_assets_ids and a3 in solution_assets_ids) or (a1 in solution_assets_ids and a3 in solution_assets_ids)
            [a1, a2] -> (a1 in solution_assets_ids and a2 in solution_assets_ids)
            [a1] -> a1 in solution_assets_ids and length(solution_assets_ids) == 1
            _ -> false
          end
        end)



    match_solution = matched_solutions
    |> Enum.max_by(&length(&1.assets), fn -> nil end)
    IO.puts("Matched Solution:")
    IO.inspect(match_solution)

    assets = for asset_id <- assets do
      Cosmos.get_asset!(asset_id)
    end

    case match_solution do
      nil -> conn |> put_flash(:error, "No matching solutions found.") |> render(:incorrect, social_issue_id: social_issue_id, social_issue_name: social_issue.name, assets: assets, num_of_youth_pop: num_of_youth_pop)
      _ -> conn |> put_flash(:info, "Correct!") |> render(:show, social_issue_id: social_issue_id, social_issue_name: social_issue.name, solution: match_solution, assets: assets, num_of_youth_pop: num_of_youth_pop)
    end
  end

  def remove_zeros(list) do
    Enum.reject(list, fn x -> x == 0 end)
  end
end

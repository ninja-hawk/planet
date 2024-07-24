defmodule Planet.Cosmos do
  @moduledoc """
  The Cosmos context.
  """

  import Ecto.Query, warn: false
  alias Planet.Repo

  alias Planet.Cosmos.Asset
  alias Planet.Cosmos.SocialIssue
  alias Planet.Cosmos.Solution

  @doc """
  Returns the list of assets.

  ## Examples

      iex> list_assets()
      [%Asset{}, ...]

  """
  def list_assets do
    Repo.all(Asset)
  end

  @doc """
  Gets a single asset.

  Raises `Ecto.NoResultsError` if the Asset does not exist.

  ## Examples

      iex> get_asset!(123)
      %Asset{}

      iex> get_asset!(456)
      ** (Ecto.NoResultsError)

  """
  def get_asset!(id), do: Repo.get!(Asset, id)

  @doc """
  Creates a asset.

  ## Examples

      iex> create_asset(%{field: value})
      {:ok, %Asset{}}

      iex> create_asset(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_asset(attrs \\ %{}) do
    %Asset{}
    |> Asset.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a asset.

  ## Examples

      iex> update_asset(asset, %{field: new_value})
      {:ok, %Asset{}}

      iex> update_asset(asset, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_asset(%Asset{} = asset, attrs) do
    asset
    |> Asset.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a asset.

  ## Examples

      iex> delete_asset(asset)
      {:ok, %Asset{}}

      iex> delete_asset(asset)
      {:error, %Ecto.Changeset{}}

  """
  def delete_asset(%Asset{} = asset) do
    Repo.delete(asset)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking asset changes.

  ## Examples

      iex> change_asset(asset)
      %Ecto.Changeset{data: %Asset{}}

  """
  def change_asset(%Asset{} = asset, attrs \\ %{}) do
    Asset.changeset(asset, attrs)
  end

  alias Planet.Cosmos.SocialIssue

  @doc """
  Returns the list of social_issues.

  ## Examples

      iex> list_social_issues()
      [%SocialIssue{}, ...]

  """
  def list_social_issues do
    Repo.all(SocialIssue)
  end

  @doc """
  Gets a single social_issue.

  Raises `Ecto.NoResultsError` if the Social issue does not exist.

  ## Examples

      iex> get_social_issue!(123)
      %SocialIssue{}

      iex> get_social_issue!(456)
      ** (Ecto.NoResultsError)

  """
  def get_social_issue!(id) do
    SocialIssue |> Repo.get!(id) |> Repo.preload(solutions: :assets)
  end

  @doc """
  Creates a social_issue.

  ## Examples

      iex> create_social_issue(%{field: value})
      {:ok, %SocialIssue{}}

      iex> create_social_issue(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_social_issue(attrs \\ %{}) do
    %SocialIssue{}
    |> SocialIssue.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a social_issue.

  ## Examples

      iex> update_social_issue(social_issue, %{field: new_value})
      {:ok, %SocialIssue{}}

      iex> update_social_issue(social_issue, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_social_issue(%SocialIssue{} = social_issue, attrs) do
    social_issue
    |> SocialIssue.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a social_issue.

  ## Examples

      iex> delete_social_issue(social_issue)
      {:ok, %SocialIssue{}}

      iex> delete_social_issue(social_issue)
      {:error, %Ecto.Changeset{}}

  """
  def delete_social_issue(%SocialIssue{} = social_issue) do
    Repo.delete(social_issue)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking social_issue changes.

  ## Examples

      iex> change_social_issue(social_issue)
      %Ecto.Changeset{data: %SocialIssue{}}

  """
  def change_social_issue(%SocialIssue{} = social_issue, attrs \\ %{}) do
    SocialIssue.changeset(social_issue, attrs)
  end

  alias Planet.Cosmos.Solution

  @doc """
  Returns the list of solutions.

  ## Examples

      iex> list_solutions()
      [%Solution{}, ...]

  """
  def list_solutions do
    Repo.all(Solution)
  end

  @doc """
  Gets a single solution.

  Raises `Ecto.NoResultsError` if the Solution does not exist.

  ## Examples

      iex> get_solution!(123)
      %Solution{}

      iex> get_solution!(456)
      ** (Ecto.NoResultsError)

  """
  def get_solution!(id), do: Repo.get!(Solution, id)

  @doc """
  Creates a solution.

  ## Examples

      iex> create_solution(%{field: value})
      {:ok, %Solution{}}

      iex> create_solution(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_solution(attrs \\ %{}) do
    %Solution{}
    |> Solution.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a solution.

  ## Examples

      iex> update_solution(solution, %{field: new_value})
      {:ok, %Solution{}}

      iex> update_solution(solution, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_solution(%Solution{} = solution, attrs) do
    solution
    |> Solution.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a solution.

  ## Examples

      iex> delete_solution(solution)
      {:ok, %Solution{}}

      iex> delete_solution(solution)
      {:error, %Ecto.Changeset{}}

  """
  def delete_solution(%Solution{} = solution) do
    Repo.delete(solution)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking solution changes.

  ## Examples

      iex> change_solution(solution)
      %Ecto.Changeset{data: %Solution{}}

  """
  def change_solution(%Solution{} = solution, attrs \\ %{}) do
    Solution.changeset(solution, attrs)
  end

  alias Planet.Cosmos.SolutionAsset

  @doc """
  Returns the list of solution_assets.

  ## Examples

      iex> list_solution_assets()
      [%SolutionAsset{}, ...]

  """
  def list_solution_assets do
    Repo.all(SolutionAsset)
  end

  @doc """
  Gets a single solution_asset.

  Raises `Ecto.NoResultsError` if the Solution asset does not exist.

  ## Examples

      iex> get_solution_asset!(123)
      %SolutionAsset{}

      iex> get_solution_asset!(456)
      ** (Ecto.NoResultsError)

  """
  def get_solution_asset!(id), do: Repo.get!(SolutionAsset, id)

  @doc """
  Creates a solution_asset.

  ## Examples

      iex> create_solution_asset(%{field: value})
      {:ok, %SolutionAsset{}}

      iex> create_solution_asset(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_solution_asset(attrs \\ %{}) do
    %SolutionAsset{}
    |> SolutionAsset.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a solution_asset.

  ## Examples

      iex> update_solution_asset(solution_asset, %{field: new_value})
      {:ok, %SolutionAsset{}}

      iex> update_solution_asset(solution_asset, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_solution_asset(%SolutionAsset{} = solution_asset, attrs) do
    solution_asset
    |> SolutionAsset.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a solution_asset.

  ## Examples

      iex> delete_solution_asset(solution_asset)
      {:ok, %SolutionAsset{}}

      iex> delete_solution_asset(solution_asset)
      {:error, %Ecto.Changeset{}}

  """
  def delete_solution_asset(%SolutionAsset{} = solution_asset) do
    Repo.delete(solution_asset)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking solution_asset changes.

  ## Examples

      iex> change_solution_asset(solution_asset)
      %Ecto.Changeset{data: %SolutionAsset{}}

  """
  def change_solution_asset(%SolutionAsset{} = solution_asset, attrs \\ %{}) do
    SolutionAsset.changeset(solution_asset, attrs)
  end

  alias Planet.Cosmos.SocialIssueSolution

  @doc """
  Returns the list of social_issue_solutions.

  ## Examples

      iex> list_social_issue_solutions()
      [%SocialIssueSolution{}, ...]

  """
  def list_social_issue_solutions do
    Repo.all(SocialIssueSolution)
  end

  @doc """
  Gets a single social_issue_solution.

  Raises `Ecto.NoResultsError` if the Social issue solution does not exist.

  ## Examples

      iex> get_social_issue_solution!(123)
      %SocialIssueSolution{}

      iex> get_social_issue_solution!(456)
      ** (Ecto.NoResultsError)

  """
  def get_social_issue_solution!(id), do: Repo.get!(SocialIssueSolution, id)

  @doc """
  Creates a social_issue_solution.

  ## Examples

      iex> create_social_issue_solution(%{field: value})
      {:ok, %SocialIssueSolution{}}

      iex> create_social_issue_solution(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_social_issue_solution(attrs \\ %{}) do
    %SocialIssueSolution{}
    |> SocialIssueSolution.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a social_issue_solution.

  ## Examples

      iex> update_social_issue_solution(social_issue_solution, %{field: new_value})
      {:ok, %SocialIssueSolution{}}

      iex> update_social_issue_solution(social_issue_solution, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_social_issue_solution(%SocialIssueSolution{} = social_issue_solution, attrs) do
    social_issue_solution
    |> SocialIssueSolution.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a social_issue_solution.

  ## Examples

      iex> delete_social_issue_solution(social_issue_solution)
      {:ok, %SocialIssueSolution{}}

      iex> delete_social_issue_solution(social_issue_solution)
      {:error, %Ecto.Changeset{}}

  """
  def delete_social_issue_solution(%SocialIssueSolution{} = social_issue_solution) do
    Repo.delete(social_issue_solution)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking social_issue_solution changes.

  ## Examples

      iex> change_social_issue_solution(social_issue_solution)
      %Ecto.Changeset{data: %SocialIssueSolution{}}

  """
  def change_social_issue_solution(%SocialIssueSolution{} = social_issue_solution, attrs \\ %{}) do
    SocialIssueSolution.changeset(social_issue_solution, attrs)
  end

  alias Planet.Cosmos.SocialIssueFlow

  @doc """
  Returns the list of social_issue_flows.

  ## Examples

      iex> list_social_issue_flows()
      [%SocialIssueFlow{}, ...]

  """
  def list_social_issue_flows do
    Repo.all(SocialIssueFlow)
  end

  @doc """
  Gets a single social_issue_flow.

  Raises `Ecto.NoResultsError` if the Social issue flow does not exist.

  ## Examples

      iex> get_social_issue_flow!(123)
      %SocialIssueFlow{}

      iex> get_social_issue_flow!(456)
      ** (Ecto.NoResultsError)

  """
  def get_social_issue_flow!(id), do: Repo.get!(SocialIssueFlow, id)

  @doc """
  Creates a social_issue_flow.

  ## Examples

      iex> create_social_issue_flow(%{field: value})
      {:ok, %SocialIssueFlow{}}

      iex> create_social_issue_flow(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_social_issue_flow(attrs \\ %{}) do
    %SocialIssueFlow{}
    |> SocialIssueFlow.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a social_issue_flow.

  ## Examples

      iex> update_social_issue_flow(social_issue_flow, %{field: new_value})
      {:ok, %SocialIssueFlow{}}

      iex> update_social_issue_flow(social_issue_flow, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_social_issue_flow(%SocialIssueFlow{} = social_issue_flow, attrs) do
    social_issue_flow
    |> SocialIssueFlow.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a social_issue_flow.

  ## Examples

      iex> delete_social_issue_flow(social_issue_flow)
      {:ok, %SocialIssueFlow{}}

      iex> delete_social_issue_flow(social_issue_flow)
      {:error, %Ecto.Changeset{}}

  """
  def delete_social_issue_flow(%SocialIssueFlow{} = social_issue_flow) do
    Repo.delete(social_issue_flow)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking social_issue_flow changes.

  ## Examples

      iex> change_social_issue_flow(social_issue_flow)
      %Ecto.Changeset{data: %SocialIssueFlow{}}

  """
  def change_social_issue_flow(%SocialIssueFlow{} = social_issue_flow, attrs \\ %{}) do
    SocialIssueFlow.changeset(social_issue_flow, attrs)
  end
end

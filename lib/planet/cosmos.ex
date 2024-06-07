defmodule Planet.Cosmos do
  @moduledoc """
  The Cosmos context.
  """

  import Ecto.Query, warn: false
  alias Planet.Repo

  alias Planet.Cosmos.Asset

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
  def get_social_issue!(id), do: Repo.get!(SocialIssue, id)

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
end

defmodule PlanetWeb.SolutionAssetHTML do
  use PlanetWeb, :html

  embed_templates "solution_asset_html/*"

  @doc """
  Renders a solution_asset form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def solution_asset_form(assigns)
end

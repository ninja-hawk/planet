defmodule PlanetWeb.SolutionHTML do
  use PlanetWeb, :html

  embed_templates "solution_html/*"

  @doc """
  Renders a solution form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def solution_form(assigns)
end

defmodule PlanetWeb.SocialIssueSolutionHTML do
  use PlanetWeb, :html

  embed_templates "social_issue_solution_html/*"

  @doc """
  Renders a social_issue_solution form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def social_issue_solution_form(assigns)
end

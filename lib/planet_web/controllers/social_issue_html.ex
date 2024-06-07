defmodule PlanetWeb.SocialIssueHTML do
  use PlanetWeb, :html

  embed_templates "social_issue_html/*"

  @doc """
  Renders a social_issue form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def social_issue_form(assigns)
end

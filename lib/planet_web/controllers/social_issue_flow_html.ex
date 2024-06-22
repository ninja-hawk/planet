defmodule PlanetWeb.SocialIssueFlowHTML do
  use PlanetWeb, :html

  embed_templates "social_issue_flow_html/*"

  @doc """
  Renders a social_issue_flow form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def social_issue_flow_form(assigns)
end

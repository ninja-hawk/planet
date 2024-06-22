flows = [
  %{social_issue_id: 2, next_social_issue_id: 4, is_yes: false, deleted_at: nil},
  %{social_issue_id: 4, next_social_issue_id: 12, is_yes: false, deleted_at: nil},
  %{social_issue_id: 12, next_social_issue_id: 13, is_yes: false, deleted_at: nil},
  %{social_issue_id: 12, next_social_issue_id: 9, is_yes: true, deleted_at: nil},
  %{social_issue_id: 9, next_social_issue_id: 13, is_yes: false, deleted_at: nil},
  %{social_issue_id: 13, next_social_issue_id: 8, is_yes: false, deleted_at: nil},
  %{social_issue_id: 13, next_social_issue_id: 21, is_yes: true, deleted_at: nil},
  %{social_issue_id: 8, next_social_issue_id: 14, is_yes: false, deleted_at: nil},
  %{social_issue_id: 14, next_social_issue_id: 7, is_yes: false, deleted_at: nil},
  %{social_issue_id: 14, next_social_issue_id: 16, is_yes: true, deleted_at: nil},
  %{social_issue_id: 7, next_social_issue_id: 15, is_yes: false, deleted_at: nil},
  %{social_issue_id: 15, next_social_issue_id: 9, is_yes: false, deleted_at: nil},
  %{social_issue_id: 15, next_social_issue_id: 16, is_yes: true, deleted_at: nil},
  %{social_issue_id: 16, next_social_issue_id: 18, is_yes: false, deleted_at: nil},
  %{social_issue_id: 16, next_social_issue_id: 17, is_yes: true, deleted_at: nil},
  %{social_issue_id: 17, next_social_issue_id: 19, is_yes: false, deleted_at: nil},
  %{social_issue_id: 17, next_social_issue_id: 20, is_yes: true, deleted_at: nil}
]

for flow <- flows do
  {:ok, _} = Planet.Cosmos.create_social_issue_flow(flow)
end

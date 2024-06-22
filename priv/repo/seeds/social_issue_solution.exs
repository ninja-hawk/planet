

data = [
  %{social_issue_id: 1, solution_id: 1, deleted_at: nil},
  %{social_issue_id: 1, solution_id: 2, deleted_at: nil},
  %{social_issue_id: 2, solution_id: 3, deleted_at: nil},
  %{social_issue_id: 2, solution_id: 4, deleted_at: nil},
  %{social_issue_id: 3, solution_id: 5, deleted_at: nil},
  %{social_issue_id: 3, solution_id: 6, deleted_at: nil},
  %{social_issue_id: 4, solution_id: 7, deleted_at: nil},
  %{social_issue_id: 4, solution_id: 8, deleted_at: nil},
  %{social_issue_id: 4, solution_id: 9, deleted_at: nil},
  %{social_issue_id: 5, solution_id: 10, deleted_at: nil},
  %{social_issue_id: 5, solution_id: 11, deleted_at: nil},
  %{social_issue_id: 6, solution_id: 12, deleted_at: nil},
  %{social_issue_id: 6, solution_id: 13, deleted_at: nil},
  %{social_issue_id: 7, solution_id: 14, deleted_at: nil},
  %{social_issue_id: 7, solution_id: 15, deleted_at: nil},
  %{social_issue_id: 8, solution_id: 16, deleted_at: nil},
  %{social_issue_id: 8, solution_id: 17, deleted_at: nil},
  %{social_issue_id: 9, solution_id: 18, deleted_at: nil},
  %{social_issue_id: 9, solution_id: 19, deleted_at: nil},
  %{social_issue_id: 9, solution_id: 20, deleted_at: nil}
]

for entry <- data do
  {:ok, _} = Planet.Cosmos.create_social_issue_solution(entry)
end



for {solution_id, asset_id, deleted_at} <- [
  {1, 10, nil},
  {2, 10, nil},
  {2, 1, nil},
  {3, 7, nil},
  {4, 7, nil},
  {4, 9, nil},
  {5, 6, nil},
  {6, 6, nil},
  {6, 9, nil},
  {7, 5, nil},
  {8, 4, nil},
  {8, 5, nil},
  {9, 5, nil},
  {9, 8, nil},
  {10, 1, nil},
  {11, 1, nil},
  {11, 2, nil},
  {12, 1, nil},
  {12, 2, nil},
  {13, 7, nil},
  {13, 9, nil},
  {14, 11, nil},
  {15, 9, nil},
  {16, 1, nil},
  {16, 2, nil},
  {17, 1, nil},
  {17, 4, nil},
  {18, 5, nil},
  {18, 4, nil},
  {19, 5, nil},
  {20, 5, nil},
  {20, 8, nil}
] do
  {:ok, _} = Planet.Cosmos.create_solution_asset(%{solution_id: solution_id, asset_id: asset_id, deleted_at: deleted_at})
end

# mix run priv/repo/seeds.exs


# Load individual seed files
Code.eval_file("priv/repo/seeds/user.exs")
Code.eval_file("priv/repo/seeds/social_issue.exs")
Code.eval_file("priv/repo/seeds/asset.exs")
Code.eval_file("priv/repo/seeds/solution.exs")
Code.eval_file("priv/repo/seeds/solution_asset.exs")
# Add more files as needed

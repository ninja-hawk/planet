# alias Planet.Accounts

for user <- [
  %{
    first_name: "Taka",
    last_name: "Yanagi",
    email: "saule.faucon@gmail.com",
    password: "planetoym",
    is_manager: true,
    is_admin: true
  },
  %{
    first_name: "Kenta",
    last_name: "Furuno",
    email: "kenta.furuno.0226@gmail.com",
    password: "planetoym",
    is_manager: true,
    is_admin: true
  },
  %{
    first_name: "Jutaro",
    last_name: "Takagi",
    email: "jutamalta9260@gmail.com",
    password: "planetoym",
    is_manager: true,
    is_admin: true,
  },
  %{
    first_name: "Test",
    last_name: "Admin",
    email: "admin@test.com",
    password: "planetoym",
    is_manager: true,
    is_admin: true,
  },
  %{
    first_name: "Test",
    last_name: "Manager",
    email: "manager@test.com",
    password: "planetoym",
    is_manager: true,
    is_admin: false,
  },
  %{
    first_name: "Test",
    last_name: "User",
    email: "user@test.com",
    password: "planetoym",
    is_manager: false,
    is_admin: false,
  },
] do
  {:ok, _} = Planet.Accounts.register_user(user)
end

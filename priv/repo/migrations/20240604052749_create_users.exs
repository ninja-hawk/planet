defmodule MyApp.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :first_name, :string, size: 30, null: false
      add :last_name, :string, size: 30, null: false
      add :email, :string, size: 255, null: false
      add :password, :string, null: false
      add :is_manager, :boolean, null: false, default: false
      add :is_admin, :boolean, null: false, default: false
      add :deleted_at, :utc_datetime

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end

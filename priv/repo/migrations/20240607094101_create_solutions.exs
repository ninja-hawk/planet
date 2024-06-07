defmodule Planet.Repo.Migrations.CreateSolutions do
  use Ecto.Migration

  def change do
    create table(:solutions) do
      add :name, :string, size: 127, null: false
      add :description, :string, size: 511
      add :low_capital_input, :integer, null: false
      add :middle_capital_input, :integer, null: false
      add :high_capital_input, :integer, null: false
      add :low_return, :integer, null: false
      add :middle_return, :integer, null: false
      add :high_return, :integer, null: false
      add :roi_func_id, :integer
      add :co2_effect, :integer, null: false
      add :is_choice, :boolean, default: false, null: false
      add :comment, :string, size: 511
      add :deleted_at, :utc_datetime

      timestamps(type: :utc_datetime)
    end
  end
end

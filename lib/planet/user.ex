defmodule Planet.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :password, :string
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :is_manager, :boolean, default: false
    field :is_admin, :boolean, default: false
    field :deleted_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :password, :is_manager, :is_admin, :deleted_at])
    |> validate_required([:first_name, :last_name, :email, :password])
    |> validate_length(:first_name, max: 30)
    |> validate_length(:last_name, max: 30)
    |> validate_length(:email, max: 255)
    |> validate_format(:email, ~r/^[\w._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$/, message: "must be a valid email address")
    |> unique_constraint(:email)
  end
end

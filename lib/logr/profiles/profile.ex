defmodule Logr.Profiles.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "profiles" do
    field :handle, :string
    field :name, :string
    field :story, :string
    field :user_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> cast(attrs, [:handle, :name, :story])
    |> validate_required([:handle, :name, :story])
    |> unique_constraint(:user_id)
    |> unique_constraint(:handle)
  end
end

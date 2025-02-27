defmodule Logr.Spaces.Space do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "spaces" do
    field :handle, :string
    field :name, :string
    field :description, :string
    field :discoverable, :boolean, default: false
    field :profile_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(space, attrs) do
    space
    |> cast(attrs, [:handle, :name, :description, :discoverable])
    |> validate_required([:handle, :name, :description, :discoverable])
    |> unique_constraint(:handle)
    |> validate_length(:handle, min: 4, max: 15, count: :bytes)
    |> validate_length(:name, min: 4, max: 25)
    |> validate_length(:description, max: 4096, count: :bytes)
  end
end

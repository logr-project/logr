defmodule Logr.Profiles.InvitationCodes do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "invitation_codes" do
    field :code, :string
    field :profile_id, :binary_id
    field :used_by_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(invitation_codes, attrs) do
    invitation_codes
    |> cast(attrs, [:code])
    |> validate_required([:code])
    |> unique_constraint(:used_by_id)
    |> unique_constraint(:code)
  end
end

defmodule Logr.Repo.Migrations.CreateInvitationCodes do
  use Ecto.Migration

  def change do
    create table(:invitation_codes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :code, :string
      add :profile_id, references(:profiles, on_delete: :nothing, type: :binary_id)
      add :used_by_id, references(:profiles, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:invitation_codes, [:used_by_id])
    create unique_index(:invitation_codes, [:code])
    create index(:invitation_codes, [:profile_id])
  end
end

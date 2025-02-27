defmodule Logr.Repo.Migrations.CreateSpaces do
  use Ecto.Migration

  def change do
    create table(:spaces, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :handle, :string, size: 15, null: false
      add :name, :string, size: 25, null: false
      add :description, :text, null: false
      add :discoverable, :boolean, default: false, null: false

      add :profile_id,
          references(:profiles, on_update: :update_all, on_delete: :delete_all, type: :binary_id),
          null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:spaces, [:handle])
    create index(:spaces, [:profile_id])
    create constraint(:spaces, :handle_min, check: "OCTET_LENGTH(handle) >= 4")
    create constraint(:spaces, :name_min, check: "CHAR_LENGTH(name) >= 4")
    create constraint(:spaces, :description_max, check: "OCTET_LENGTH(description) <= 4096")
  end
end

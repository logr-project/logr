defmodule Logr.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :handle, :string, size: 15, null: false
      add :name, :string, size: 25, null: false
      add :story, :text, null: false

      add :user_id,
          references(:users, on_update: :update_all, on_delete: :delete_all, type: :binary_id),
          null: false

      timestamps(type: :utc_datetime)
    end

    create unique_index(:profiles, [:user_id])
    create unique_index(:profiles, [:handle])
    create constraint(:profiles, :handle_min, check: "OCTET_LENGTH(handle) >= 4")
    create constraint(:profiles, :name_min, check: "CHAR_LENGTH(name) >= 4")
    create constraint(:profiles, :story_max, check: "OCTET_LENGTH(story) <= 4096")
  end
end

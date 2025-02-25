defmodule Logr.Repo.Migrations.CreateProfiles do
  use Ecto.Migration

  def change do
    create table(:profiles, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :handle, :string
      add :name, :string
      add :story, :text
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:profiles, [:user_id])
    create unique_index(:profiles, [:handle])
  end
end

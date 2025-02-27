defmodule Logr.Repo.Migrations.CreateSpaces do
  use Ecto.Migration

  def change do
    create table(:spaces, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :handle, :string
      add :name, :string
      add :description, :text
      add :discoverable, :boolean, default: false, null: false
      add :profile_id, references(:profiles, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:spaces, [:handle])
    create index(:spaces, [:profile_id])
  end
end

defmodule Logr.Repo.Migrations.CreateLogs do
  use Ecto.Migration

  def change do
    create table(:logs, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string
      add :slug, :string
      add :quick_view, :text
      add :content, :text
      add :logged_at, :utc_datetime
      add :discoverable, :boolean, default: false, null: false
      add :space_id, references(:spaces, on_delete: :nothing, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:logs, [:space_id])
  end
end

defmodule Logr.Repo.Migrations.CreateLogs do
  use Ecto.Migration

  def change do
    create table(:logs, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :title, :string, size: 50, null: false
      add :slug, :string, size: 50, null: false
      add :quick_view, :text, null: false
      add :content, :text, null: false
      add :logged_at, :utc_datetime
      add :discoverable, :boolean, default: false, null: false

      add :space_id,
          references(:spaces, on_update: :update_all, on_delete: :delete_all, type: :binary_id),
          null: false

      timestamps(type: :utc_datetime)
    end

    create index(:logs, [:space_id])
    create unique_index(:logs, [:space_id, :slug])
    create constraint(:logs, :slug_contains, check: "OCTET_LENGTH(slug) >= 1")

    create constraint(:logs, :quick_view_min_and_max,
             check: "OCTET_LENGTH(quick_view) >= 3 AND OCTET_LENGTH(quick_view) <= 4096"
           )

    create constraint(:logs, :content_min_and_max,
             check: "OCTET_LENGTH(content) >= 3 AND OCTET_LENGTH(content) <= 61440"
           )
  end
end

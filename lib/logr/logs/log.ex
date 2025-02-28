defmodule Logr.Logs.Log do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "logs" do
    field :title, :string
    field :slug, :string
    field :quick_view, :string
    field :content, :string
    field :logged_at, :utc_datetime
    field :discoverable, :boolean, default: false
    field :space_id, :binary_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(log, attrs) do
    log
    |> cast(attrs, [:title, :slug, :quick_view, :content, :logged_at, :discoverable])
    |> validate_required([:title, :slug, :quick_view, :content, :logged_at, :discoverable])
  end
end

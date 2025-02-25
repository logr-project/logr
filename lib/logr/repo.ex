defmodule Logr.Repo do
  use Ecto.Repo,
    otp_app: :logr,
    adapter: Ecto.Adapters.Postgres
end

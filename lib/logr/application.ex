defmodule Logr.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LogrWeb.Telemetry,
      Logr.Repo,
      {DNSCluster, query: Application.get_env(:logr, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Logr.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Logr.Finch},
      # Start a worker by calling: Logr.Worker.start_link(arg)
      # {Logr.Worker, arg},
      # Start to serve requests, typically the last entry
      LogrWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Logr.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LogrWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

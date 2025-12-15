defmodule TodoLiveview.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TodoLiveviewWeb.Telemetry,
      TodoLiveview.Repo,
      {DNSCluster, query: Application.get_env(:todo_liveview, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TodoLiveview.PubSub},
      # Start a worker by calling: TodoLiveview.Worker.start_link(arg)
      # {TodoLiveview.Worker, arg},
      # Start to serve requests, typically the last entry
      TodoLiveviewWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TodoLiveview.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TodoLiveviewWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

defmodule Admin.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      Admin.Telemetry,
      # Start the Endpoint (http/https)
      Admin.Endpoint,
      {Phoenix.PubSub, name: Admin.PubSub}
      # Start a worker by calling: Admin.Worker.start_link(arg)
      # {Admin.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Admin.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    Admin.Endpoint.config_change(changed, removed)
    :ok
  end
end

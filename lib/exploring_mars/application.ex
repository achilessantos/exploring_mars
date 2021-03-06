defmodule ExploringMars.Application do
  use Application

  def start(_type, _args) do
    children = [
      {Phoenix.PubSub, name: ExploringMars.PubSub},
      ExploringMarsWeb.Endpoint,
      {ExploringMars.GetProbeData, name: ExploringMars.GetProbeData}
    ]

    opts = [strategy: :one_for_one, name: ExploringMars.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    ExploringMarsWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end

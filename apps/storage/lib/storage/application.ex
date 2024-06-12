defmodule Storage.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Storage.PostgresRepo, Storage.SqliteRepo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Storage.PubSub},
      # Start Finch
      {Finch, name: Storage.Finch}
      # Start a worker by calling: Storage.Worker.start_link(arg)
      # {Storage.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Storage.Supervisor)
  end
end

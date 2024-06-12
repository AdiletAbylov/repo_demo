defmodule RepoDemo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: RepoDemo.PubSub},
      # Start Finch
      {Finch, name: RepoDemo.Finch}
      # Start a worker by calling: RepoDemo.Worker.start_link(arg)
      # {RepoDemo.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: RepoDemo.Supervisor)
  end
end

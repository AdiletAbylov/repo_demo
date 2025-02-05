defmodule Storage.MixProject do
  use Mix.Project

  def project do
    [
      app: :storage,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Storage.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix_pubsub, "~> 2.1"},
      {:ecto_sql, "~> 3.10"},
      {:ecto_sqlite3, ">= 0.0.0"},
      {:postgrex, ">= 0.0.0"},
      {:jason, "~> 1.2"},
      {:swoosh, "~> 1.3"},
      {:finch, "~> 0.13"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get", "ecto.setup"],
      "ecto.setup": [
        "ecto.create",
        "ecto.sqlite.setup",
        fn _ -> Mix.Task.reenable("ecto.migrate") end,
        "ecto.postgres.setup"
      ],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate --quiet", "test"],
      "ecto.sqlite.setup": [
        "ecto.create -r Storage.SqliteRepo",
        "ecto.migrate -r Storage.SqliteRepo"
      ],
      "ecto.postgres.setup": [
        "ecto.create -r Storage.PostgresRepo",
        "ecto.migrate -r Storage.PostgresRepo --migrations-path priv/postgres_repo/migrations  --migrations-path priv/sqlite_repo/migrations"
      ]
    ]
  end
end

# RepoDemo

The purpose of this project is to research the ability to maintain more than one repos in a single application under an umbrella.

The umbrella project contains three apps: the `storage` app, the web `repo_demo_web` app and a context app `repo_demo`

## Storage app

The purpose of the storage app is to encapsulate details of storing data, schemas and repos.
There are two repos for different databases (Sqlite and Postgres) in this app.
Migrations of the Sqlite database are also run for the Postgres database. This is achieved via `--migrations-path` option passed to `ecto.migrate` command.

You can take a look storage's `mix.exs` for aliases:

```elixir
"ecto.postgres.setup": [
        "ecto.create -r Storage.PostgresRepo",
        "ecto.migrate -r Storage.PostgresRepo --migrations-path priv/postgres_repo/migrations  --migrations-path priv/sqlite_repo/migrations"
      ]
```

## The web app

The web `repo_demo_web` app uses the `storage` app as a dependency and utilizes the PostgresRepo of it.
There is a context `RepoDemoWeb.Posts` module that works with the `Storage.Post` schema.
There is the `RepoDemoWeb.PostsTest` test for the context module.

There is an alias in the main `mix.exs` file to run tests with proper migrations:


```elixir
test: [
        "ecto.create -r Storage.PostgresRepo --quiet",
        "ecto.migrate -r Storage.PostgresRepo --migrations-path apps/storage/priv/postgres_repo/migrations  --migrations-path apps/storage/priv/sqlite_repo/migrations --quiet",
        "test"
      ]
```

## Creating of migrations

To create a migration use `-r` option to pass a repo name.
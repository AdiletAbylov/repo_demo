defmodule Storage.PostgresRepo do
  use Ecto.Repo,
    otp_app: :storage,
    adapter: Ecto.Adapters.Postgres
end


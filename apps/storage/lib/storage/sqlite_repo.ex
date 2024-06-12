defmodule Storage.SqliteRepo do
  use Ecto.Repo,
    otp_app: :storage,
    adapter: Ecto.Adapters.SQLite3
end

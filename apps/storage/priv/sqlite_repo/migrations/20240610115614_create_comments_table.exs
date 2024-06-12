defmodule Storage.SqliteRepo.Migrations.CreateCommentsTable do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :body, :string
      add :post_id, references("posts")
    end
  end
end

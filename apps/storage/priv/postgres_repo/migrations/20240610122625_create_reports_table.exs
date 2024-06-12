defmodule Storage.PostgresRepo.Migrations.CreateReportsTable do
  use Ecto.Migration

  def change do
    create table(:reports) do
      add :body, :string
      add :count, :integer
    end
  end
end

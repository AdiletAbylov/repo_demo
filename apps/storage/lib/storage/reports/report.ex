defmodule Storage.Report do
  @moduledoc """
  Reports schema
  """
  use Ecto.Schema

  schema "reports" do
    field :body, :string
    field :count, :integer
  end
end

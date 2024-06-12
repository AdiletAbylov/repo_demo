defmodule Storage.Comment do
  @moduledoc """
  Comments schema that belongs to Post
  """
  use Ecto.Schema

  schema "comments" do
    field :body, :string
    belongs_to :post, Storage.Post
  end
end

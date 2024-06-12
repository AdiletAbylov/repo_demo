defmodule Storage.Post do
  @moduledoc """
  Post schema
  """

  use Ecto.Schema

  schema "posts" do
    field :title, :string
    field :body, :string

    has_many :comments, Storage.Comment
  end
end

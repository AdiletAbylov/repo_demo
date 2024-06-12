defmodule RepoDemoWeb.Posts do
  alias Storage.Post
  alias Storage.PostgresRepo, as: Repo

  def list_posts do
    Repo.all(Post)
  end
end

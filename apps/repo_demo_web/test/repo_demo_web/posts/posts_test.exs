defmodule RepoDemoWeb.PostsTest do
  use RepoDemoWeb.DataCase

  alias RepoDemoWeb.Posts

  test "list_posts" do
    assert [] = Posts.list_posts()
  end
end

defmodule ElixirTips.Factory do
  use ExMachina.Ecto, repo: ElixirTips.Repo
  alias ElixirTips.Accounts.User

  def user_factory do
    %User{
      username: "John Deere",
      email: "john-deere@aol.com",
      password: "abc123",
      potions: 0,
      avatar: ""
    }
  end
end

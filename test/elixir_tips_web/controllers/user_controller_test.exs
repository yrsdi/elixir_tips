defmodule ElixirTipsWeb.UserControllerTest do
  use ElixirTipsWeb.ConnCase

  alias ElixirTips.Accounts

  @create_attrs %{
    avatar: "image",
    email: "bobemail@aol.com",
    password_hash: "abc123",
    potions: 42,
    username: "bobbybob"
  }
  @update_attrs %{
    avatar: "new_image.png",
    email: "newemail@aol.com",
    password_hash: "newpasshash",
    potions: 43,
    username: "robertrobbinson"
  }
  @invalid_attrs %{avatar: nil, email: nil, password_hash: nil, potions: nil, username: nil}

  def fixture(:user) do
    {:ok, user} = Accounts.create_user(@create_attrs)
    user
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, user_path(conn, :index))
      assert html_response(conn, 200) =~ "<body>"
    end
  end

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get(conn, user_path(conn, :new))
      assert html_response(conn, 200) =~ "<body>"
    end
  end

  describe "create user" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, user_path(conn, :create), user: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == user_path(conn, :show, id)

      conn = get(conn, user_path(conn, :show, id))
      assert html_response(conn, 200) =~ "<body>"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, user_path(conn, :create), user: @invalid_attrs)
      assert html_response(conn, 200) =~ "<body>"
    end
  end

  describe "edit user" do
    setup [:create_user]

    test "renders form for editing chosen user", %{conn: conn, user: user} do
      conn = get(conn, user_path(conn, :edit, user))
      assert html_response(conn, 200) =~ "<body>"
    end
  end

  describe "update user" do
    setup [:create_user]

    test "redirects when data is valid", %{conn: conn, user: user} do
      conn = put(conn, user_path(conn, :update, user), user: @update_attrs)
      assert redirected_to(conn) == user_path(conn, :show, user)

      conn = get(conn, user_path(conn, :show, user))
      assert html_response(conn, 200) =~ "<body>"
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, user_path(conn, :update, user), user: @invalid_attrs)
      assert html_response(conn, 200) =~ "<body>"
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, user_path(conn, :delete, user))
      assert redirected_to(conn) == user_path(conn, :index)

      assert_error_sent(404, fn ->
        get(conn, user_path(conn, :show, user))
      end)
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    {:ok, user: user}
  end
end

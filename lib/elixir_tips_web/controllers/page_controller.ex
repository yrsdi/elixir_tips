defmodule ElixirTipsWeb.PageController do
  use ElixirTipsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def info(conn, _params) do
    render(conn, "info.html")
  end

  def leaderboard(conn, _params) do
    IO.puts("############ ~~ CONN ~~ ############")
    IO.inspect(conn)

    IO.puts("############ ~~ / CONN ~~ ############")

    conn
    |> put_flash(:info, "Testing flash")
    |> render("leaderboard.html")
  end
end

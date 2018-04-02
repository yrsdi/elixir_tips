defmodule ElixirTipsWeb.PageController do
  use ElixirTipsWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

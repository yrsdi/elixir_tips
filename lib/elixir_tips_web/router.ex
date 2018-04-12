defmodule ElixirTipsWeb.Router do
  use ElixirTipsWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(ElixirTipsWeb.Plugs.SetUser)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", ElixirTipsWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
    get("/info", PageController, :info)
    get("/leaderboard", PageController, :leaderboard)
    resources("/users", UserController)

    ## Routes for sessions ##
    get("/login", SessionController, :new)
    post("/login", SessionController, :create)
    delete("/logout", SessionController, :delete)
  end

  # Other scopes may use custom stacks.
  # scope "/api", ElixirTipsWeb do
  #   pipe_through :api
  # end
end

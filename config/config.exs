# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elixir_tips,
  ecto_repos: [ElixirTips.Repo]

# Configures the endpoint
config :elixir_tips, ElixirTipsWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "f/5LUZqnS/LsjHDlnAfMvN6iVxIh9kWfS/Z9WxokT3QXL0bxvqjfmqA/mMOrkrqG",
  render_errors: [view: ElixirTipsWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirTips.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

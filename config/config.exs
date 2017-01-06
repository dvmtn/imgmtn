# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :imgmtn,
  ecto_repos: [Imgmtn.Repo]

# Configures the endpoint
config :imgmtn, Imgmtn.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9Mvw7rHIWyU0vgTv7N+62O9Ca/uusP6SvaAORKnSZwjcxuehY8PByXHePwV/6sHl",
  render_errors: [view: Imgmtn.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Imgmtn.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

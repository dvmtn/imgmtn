use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :imgmtn, Imgmtn.Endpoint,
  http: [port: 4001],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :imgmtn, Imgmtn.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "imgmtn_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :hound, driver: "phantomjs"

config :imgmtn, sql_sandbox: true

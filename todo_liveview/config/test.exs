import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :todo_liveview, TodoLiveview.Repo,
  username: "postgres",
  password: "postgres",
  hostname: "localhost",
  database: "todo_liveview_test#{System.get_env("MIX_TEST_PARTITION")}",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :todo_liveview, TodoLiveviewWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "l7cax4rurQf4/hhd7albFd1mOuq4dEuWvkEe0dJgN+6W6l0Es9p1TCsDVm1Kam2p",
  server: false

# In test we don't send emails
config :todo_liveview, TodoLiveview.Mailer, adapter: Swoosh.Adapters.Test

# Disable swoosh api client as it is only required for production adapters
config :swoosh, :api_client, false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

# Enable helpful, but potentially expensive runtime checks
config :phoenix_live_view,
  enable_expensive_runtime_checks: true

# Sort query params output of verified routes for robust url comparisons
config :phoenix,
  sort_verified_routes_query_params: true

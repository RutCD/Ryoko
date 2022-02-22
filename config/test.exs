import Config

# Only in tests, remove the complexity from the password hashing algorithm
config :bcrypt_elixir, :log_rounds, 1

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :database, Database.Repo,
  username: "postgres",
  password: "postgres",
  database: "database_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :api, Api.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4006],
  secret_key_base: "RHVgk47ur1ANi7pcUwjVsb+Lmx1+2f5TnnhFclkctjAb+mlIO/XAUZrBDJQowu/j",
  server: false

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :admin, Admin.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4007],
  secret_key_base: "lOK/8IPJsmFmfW2ZltoSwK8wXt6+xTKvhkxmRqMSiqxnATmvJb7HrZ+B2vAShj5W",
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# In test we don't send emails.
config :ryoko, Ryoko.Mailer, adapter: Swoosh.Adapters.Test

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime

use Mix.Config

config :surfline_regions, SurflineRegionsWeb.Endpoint,
  load_from_system_env: true,
  http: [port: 8888],
  url: [host: "surfliner.maxworld.tech", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info

config :phoenix, :serve_endpoints, true

# import_config "prod.secret.exs"

config :surfline_regions, SurflineRegions.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env('DATABASE_URL', nil)
  pool_size: 10

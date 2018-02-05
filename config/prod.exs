use Mix.Config

config :surfline_regions, SurflineRegionsWeb.Endpoint,
  load_from_system_env: true,
  url: [host: "surfliner.maxworld.com", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

config :logger, level: :info

import_config "prod.secret.exs"

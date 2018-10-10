# Surfline Regions

Search Areas, Regions and Sub Regions for Surfline Forecasts.

This app creates a searchable UI and API for Areas, Regions and Sub Regions managed by Surfline and their internal IDs (used by the forecast API).

# Setup

To setup this project:

*   Since the old Surfline site is gone, you'll have to restore from a DB dump. That'll go something like `createdb surfline_regions_dev && pg_restore -U postgres --dbname=surfline_regions_dev priv/repo/surfline_regions_prod_09102018.sqlc`
*   Setup the database and frontend with `mix setup`
*   Start Phoenix with `mix phx.server`

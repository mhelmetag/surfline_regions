defmodule SurflineRegionsWeb.Router do
  use SurflineRegionsWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", SurflineRegionsWeb do
    pipe_through(:browser)

    get("/", AreaController, :index)

    resources "/areas", AreaController, only: [:index, :show] do
      resources "/regions", RegionController, only: [:index, :show] do
        resources("/sub_regions", SubRegionController, only: [:index, :show])
      end
    end
  end

  scope "/api", SurflineRegionsWeb, as: :api do
    pipe_through(:api)

    resources "/areas", Api.AreaController, only: [:index, :show] do
      resources "/regions", Api.RegionController, only: [:index, :show] do
        resources(
          "/sub_regions",
          Api.SubRegionController,
          only: [:index, :show]
        )
      end
    end
  end
end

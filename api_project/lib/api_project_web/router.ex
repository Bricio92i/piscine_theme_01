defmodule ApiProjectWeb.Router do
  use ApiProjectWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :json_api do
    plug :accepts, ["json-api"]
    plug JaSerializer.Deserializer
  end

  # Other scopes may use custom stacks.
  scope "/api", ApiProjectWeb do
    pipe_through :json_api

    """
    resources "/users", UserController, except: [:new, :show]
    resources "/workingtimes", WorkingtimeController, except: [:new, :show]
    resources "/clocks", ClockController, except: [:new, :show]
    """

    ### Users
    get "/users/all", UserController, :index
    get "/users", UserController, :show_user_by_email_pass
    post "/users/by_token", UserController, :show_user_by_token
    get "/users/:id", UserController, :show
    post "/users", UserController, :create
    put "/users/:id", UserController, :update
    delete "/users/:id", UserController, :delete

    ### Workingtimes
    get "/workingtimes/:user_id", WorkingtimeController, :show_user_by_start_end
    get "/workingtimes/:user_id/:workingtime_id", WorkingtimeController, :show_wt_by_user_and_wtid
    post "/workingtimes/:user_id", WorkingtimeController, :create
    put "/workingtimes/:id", WorkingtimeController, :update
    delete "/workingtimes/:id", WorkingtimeController, :delete

    ### Clocks
    get "/clocks/:user_id", ClockController, :show
    post "/clocks/:user_id", ClockController, :create
  end
end

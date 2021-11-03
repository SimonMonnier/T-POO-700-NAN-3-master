defmodule ApiWeb.Router do
  use ApiWeb, :router

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

  # Other scopes may use custom stacks.
  scope "/api", ApiWeb do
    pipe_through :api

    get "/users", UserController, :index
    get "/users/:userID", UserController, :show
    post "/users", UserController, :create
    put "/users/:userID", UserController, :update
    delete "/users/:userID", UserController, :delete

    get "/workingtimes/:userID", WorkingtimeController, :index
    get "/workingtimes/:userID/:id", WorkingtimeController, :show
    post "/workingtimes/:userID", WorkingtimeController, :create
    delete "/workingtimes/:id", WorkingtimeController, :delete
    put "/workingtimes/:id", WorkingtimeController, :update

    get "/clocks/:userID", ClockController, :show
    post "/clocks/:userID", ClockController, :create
  end
end

defmodule Imgmtn.Router do
  use Imgmtn.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  pipeline :tfa do
    plug Imgmtn.Plugs.Tfa
  end

  scope "/" do
    pipe_through :browser
    coherence_routes()
    get "/tfa", Imgmtn.TfaController, :index
    post "/tfa", Imgmtn.TfaController, :create
    get "/tfa_delete", Imgmtn.TfaController, :delete
  end

  scope "/" do
    pipe_through :protected
    coherence_routes :protected
  end

  scope "/", Imgmtn do
    pipe_through :browser
    get "/", PageController, :index
  end

  scope "/", Imgmtn do
    pipe_through [:protected, :tfa]

    resources "/users", UserController
    resources "/privates", Imgmtn.PrivateController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Imgmtn do
    #   pipe_through :api
    # end
end

defmodule Imgmtn.PageController do
  use Imgmtn.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

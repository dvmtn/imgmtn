defmodule Imgmtn.PageController do
  use Imgmtn.Web, :controller

  def index(conn, _params) do
    user = conn.assigns[:current_user] || %{name: 'anonymous!'}
    render conn, "index.html", %{user: %{name: user.name}}
  end
end

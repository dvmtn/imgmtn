defmodule Imgmtn.PageController do
  use Imgmtn.Web, :controller

  def index(conn, _params) do
    user = Addict.Helper.current_user(conn) || %{name: 'anonymous!'}
    render conn, "index.html", %{user: user}
  end
end

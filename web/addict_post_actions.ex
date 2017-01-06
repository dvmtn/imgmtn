defmodule Imgmtn.AddictPostActions do
  import Phoenix.Controller, only: [redirect: 2]
  alias Imgmtn.Router.Helpers

  def post_logout(conn, status, model) do
    conn
      |> redirect(to: Helpers.page_path(conn, :index))
  end
end

defmodule Imgmtn.Plugs.Tfa do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _) do
    IO.inspect get_session(conn, :tfa)
    IO.inspect get_session(conn, :tfr)
    cond do
      Coherence.logged_in?(conn) && !get_session(conn, :tfa) ->
        conn |> redirect_to_tfa
      true ->
        conn
    end
  end

  defp redirect_to_tfa(conn) do
    conn |> Phoenix.Controller.redirect(to: "/tfa") |> halt
  end
end

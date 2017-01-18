defmodule Imgmtn.TfaController do
  use Imgmtn.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, params) do
    code = params["tfa"]["code"]
    case code do
      "1234" ->
        con = put_session(conn, :tfa, true)
        IO.puts "Assigned tfa in con!"
        IO.inspect con.assigns
        redirect(con, to: "/users")
      _ ->
        IO.puts "Skipped tfa assignment"
        redirect(conn, to: "/tfa")
    end
  end

  def delete(conn, _params) do
    con = put_session(conn, :tfa, false)
    redirect(con, to: "/")
  end
end

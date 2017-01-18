defmodule Imgmtn.TfaController do
  use Imgmtn.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, params) do
    code = params["tfa"]["code"]
    secret = "MFRGGZDFMZTWQ2LK"
    is_valid = :pot.valid_totp(code, secret, [last_30_seconds(), next_30_seconds()])
    case is_valid do
      true ->
        con = put_session(conn, :tfa, true)
        redirect(con, to: "/users")
      _ ->
        redirect(conn, to: "/tfa")
    end
  end

  def delete(conn, _params) do
    con = put_session(conn, :tfa, false)
    redirect(con, to: "/")
  end

  defp last_30_seconds do
    trunc(:os.system_time(:seconds) / 30) - 1
  end

  defp next_30_seconds do
    trunc(:os.system_time(:seconds) / 30) + 1
  end
end

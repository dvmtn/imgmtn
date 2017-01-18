defmodule Imgmtn.Plugs.Tfa do
  use Imgmtn.ConnCase

  test "user is redirected when current_user is not assigned" do
    conn = conn() |> Imgmtn.Plugs.Tfa.call(%{})

    assert redirected_to(conn) == "/sign_in"
  end

  test "user passes through when current_user is assigned" do
  conn =
    conn()
    |> assign(:current_user, %Imgmtn.User{})
    |> Imgmtn.Plugs.Tfa.call(%{})

    assert conn.status != 302
  end
end

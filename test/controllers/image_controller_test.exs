defmodule Imgmtn.ImageControllerTest do
  use Imgmtn.ConnCase

  setup %{conn: conn} do
    user_details = %{
      email: "test@example.com",
      name: "test user",
      password: "password",
      password_confirmation: "password"
    }
    user = Imgmtn.User.changeset( %Imgmtn.User{}, user_details)
            |> Imgmtn.Repo.insert!

    {:ok, conn: assign(conn, :current_user, user), user: user}
  end

  test "POST /image", %{conn: conn} do
    conn = post conn, "/image", %{image: %{name: %Plug.Upload{}}}
    assert html_response(conn, 200) =~ "Welcome anonymous"
  end
end

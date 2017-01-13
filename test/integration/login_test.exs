defmodule Imgmtn.LoginTest do
  use Imgmtn.IntegrationCase
  alias Imgmtn.User

  test "Initially logged out" do
    navigate_to("/")
    assert element_displayed?({:link_text, "Log in"})
  end

  test "logging in" do
    user = %User{email: "test@example.com", name: "test user", password: "password"} |> Repo.insert!

    navigate_to("/")
    click({:link_text, "Log in"})
    fill_field({:id, "txt-email"}, user.email)
    fill_field({:id, "txt-password"}, "password")
    click({:id, "btn-login"})
    assert element_displayed?({:link_text, "Sign out"})
  end

end

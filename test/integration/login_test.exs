defmodule Imgmtn.LoginTest do
  use Imgmtn.IntegrationCase
  alias Imgmtn.User

  test "Initially logged out" do
    navigate_to("/")
    assert element_displayed?({:link_text, "Log in"})
  end

  test "logging in" do
    user = User.create(%{email: "test@example.com", name: "test user", password: "password"})

    navigate_to("/")
    click({:link_text, "Log in"})
  end

end

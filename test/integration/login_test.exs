defmodule Imgmtn.LoginTest do
  use Imgmtn.IntegrationCase

  test "Initially logged out" do
    navigate_to("/")
    assert element_displayed?({:link_text, "Log in"})
  end

end

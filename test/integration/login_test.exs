defmodule Imgmtn.LoginTest do
	use Imgmtn.IntegrationCase, async: true
	alias Imgmtn.User

	test "Initially logged out" do
		navigate_to("/")
		assert element_displayed?({:link_text, "Log in"})
	end

	test "logging in" do
		user_details = %{
			email: "test@example.com",
			name: "test user",
			password: "password",
			password_confirmation: "password"
		}
		user = User.changeset( %User{}, user_details)
				 |> Imgmtn.Repo.insert!


		navigate_to("/")
		click({:link_text, "Log in"})
		fill_field({:id, "session_email"}, user.email)
		fill_field({:id, "session_password"}, user.password)
		click({:css, "button.btn.sign-in"})
		assert element_displayed?({:link_text, "Sign out"})
	end

end

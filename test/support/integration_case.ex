defmodule Imgmtn.IntegrationCase do
	use ExUnit.CaseTemplate

	using do
		quote do
			use Hound.Helpers
			alias Imgmtn.Repo

			# import Ecto.Model
			import Ecto.Query, only: [from: 2]
			import Imgmtn.Router.Helpers

			# The default endpoint for testing
			@endpoint Imgmtn.Endpoint

			# hound_session()
		end
	end

	setup tags do
		# Explicitly get a connection before each test
		:ok = Ecto.Adapters.SQL.Sandbox.checkout(Imgmtn.Repo)

		if tags[:async] do
			metadata = Phoenix.Ecto.SQL.Sandbox.metadata_for(Imgmtn.Repo, self())
			Hound.start_session(metadata: metadata)
		else
			Hound.start_session
			Ecto.Adapters.SQL.Sandbox.mode(Imgmtn.Repo, {:shared, self()})
		end

		:ok
	end
end

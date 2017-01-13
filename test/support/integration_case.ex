defmodule Imgmtn.IntegrationCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      use Hound.Helpers

      # import Ecto.Model
      import Ecto.Query, only: [from: 2]
      import Imgmtn.Router.Helpers

      alias Imgmtn.Repo

      # The default endpoint for testing
      @endpoint Imgmtn.Endpoint

      hound_session()
    end
  end

  setup do
    # Explicitly get a connection before each test
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Imgmtn.Repo)
  end
end

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

  setup tags do
    unless tags[:async] do
      # Ecto.Adapters.SQL.restart_test_transaction(Imgmtn.Repo, [])
    end

    :ok
  end
end

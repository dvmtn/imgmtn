Application.ensure_all_started(:hound)

ExUnit.configure formatters: [ExUnit.CLIFormatter, ExUnitNotifier]
ExUnit.start

Ecto.Adapters.SQL.Sandbox.mode(Imgmtn.Repo, :manual)

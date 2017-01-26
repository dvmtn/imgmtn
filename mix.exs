defmodule Imgmtn.Mixfile do
  use Mix.Project

  def project do
    [app: :imgmtn,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Imgmtn, []},
     applications: [:coherence, :phoenix, :phoenix_pubsub, :phoenix_html, :cowboy, :logger, :gettext,
                    :phoenix_ecto, :postgrex, :arc_ecto]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    prod_deps() ++ dev_test_deps() ++ dev_deps()
  end

  defp prod_deps do
    [
      {:phoenix, "~> 1.2.1"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.6"},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:coherence, "~> 0.3"},
      {:arc_ecto, "~> 0.5.0"},
    ]
  end

  defp dev_test_deps do
    dep_group [:dev, :test],
    [
      {:credo, "~> 0.5"},
      {:dogma, "~> 0.1"},
      {:hound, "~> 1.0"},
      {:ex_unit_notifier, "~> 0.1"},
    ]
  end

  defp dev_deps do
    dep_group :dev,
    [
      {:phoenix_live_reload, "~> 1.0"},
      {:mix_test_watch, "~> 0.2"},
      {:edeliver, "~> 1.4.0"},
      {:distillery, ">= 0.8.0", warn_missing: false},
    ]
  end

  defp dep_group load_envs, deps do
    Enum.map(deps, fn dep -> only_load(dep, load_envs) end)
  end

  defp only_load({name, version, opts}, load_envs) do
    {name, version, Keyword.merge(opts, only: load_envs)}
  end

  defp only_load(dep, load_envs) do
    Tuple.append(dep, only: load_envs)
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test"],
      "testall": ["ecto.create --quiet", "ecto.migrate", "test", "dogma", "credo"],
    ]
  end
end

defmodule Imgmtn.User do
  use Imgmtn.Web, :model
  use Coherence.Schema
  alias Imgmtn.Repo
  alias Imgmtn.User

  schema "users" do
    field :name, :string
    field :email, :string
    coherence_schema

    timestamps()
  end

  def changeset(model, params \\ %{}) do
    model
    |> cast(params, [:name, :email] ++ coherence_fields)
    |> validate_required([:name, :email])
    |> validate_format(:email, ~r/@/)
    |> validate_coherence(params)
  end
end

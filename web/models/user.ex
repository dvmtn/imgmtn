defmodule Imgmtn.User do
  use Imgmtn.Web, :model
  alias Imgmtn.Repo
  alias Imgmtn.User

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, virtual: true
    field :encrypted_password, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :encrypted_password])
    |> validate_required([:name, :email, :encrypted_password])
  end
end

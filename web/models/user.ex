defmodule Imgmtn.User do
  use Imgmtn.Web, :model
  alias Comeonin.Bcrypt
  alias Imgmtn.Repo
  alias Imgmtn.User

  schema "users" do
    field :name, :string
    field :email, :string
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

  @doc """
  Takes a changeset and hashes the password, then inserts it into the db
  """
  def create(user_details) do
    details_with_encrypted_pw = user_details
                                |> Map.merge(%{encrypted_password: Bcrypt.hashpwsalt(user_details.password)})
                                |> Map.delete(:password)

    changeset(%User{}, details_with_encrypted_pw)
      |> Repo.insert!
  end
end

defmodule Imgmtn.Image do
  use Imgmtn.Web, :model
  use Arc.Ecto.Schema

  schema "images" do
    field :name, Imgmtn.Uploaders.Image.Type
    belongs_to :user, Imgmtn.User

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id])
    |> cast_attachments(params, [:name])
    |> validate_required([:name, :user_id])
  end
end

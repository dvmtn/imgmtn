defmodule Imgmtn.ImageController do
  use Imgmtn.Web, :controller

  def upload(conn, %{"image" => image_params}) do
    current_user = conn.assigns[:current_user]

    change_params = Map.merge(image_params, %{"user_id" => current_user.id})
    changeset = Imgmtn.Image.changeset(%Imgmtn.Image{}, change_params)
    Repo.insert(changeset)

    redirect(conn, to: "/")
  end
end

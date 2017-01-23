defmodule Imgmtn.ImageTest do
  use Imgmtn.ModelCase

  alias Imgmtn.Image

  @invalid_attrs %{}

  test "changeset with invalid attributes" do
    changeset = Image.changeset(%Image{}, @invalid_attrs)
    refute changeset.valid?
  end
end

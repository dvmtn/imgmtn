defmodule Imgmtn.UserTest do
  use Imgmtn.ModelCase

  alias Imgmtn.User

  @valid_attrs %{email: "foo@bar.com", password: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end

defmodule Imgmtn.Repo.Migrations.CreateImage do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :name, :string
      add :user_id, :integer

      timestamps()
    end

  end
end

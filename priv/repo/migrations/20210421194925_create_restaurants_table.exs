defmodule Inmana.Repo.Migrations.CreateRestaurantsTable do
  @moduledoc """
  Create restaurants table.
  """
  use Ecto.Migration

  def change do
    create table(:restaurants) do
      add :email, :string
      add :name, :string

      timestamps()
    end

    create unique_index(:restaurants, [:email])
  end
end

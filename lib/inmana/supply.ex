defmodule Inmana.Supply do
  @moduledoc """
  Inmana Supply schema.
  """
  use Ecto.Schema
  import Ecto.Changeset

  alias Inmana.Restaurant

  @primary_key {:id, :binary_id, autogenerate: true}

  @foreign_key_type :binary_id

  @required_params [:description, :expiration_date, :responsible, :restaurant_id]

  @derive {Jason.Encoder, only: @required_params ++ [:id]}

  schema "supplies" do
    field :description, :string
    field :expiration_date, :date
    field :responsible, :string

    belongs_to :restaurant, Restaurant

    timestamps()
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
    |> validate_length(:description, min: 2)
    |> validate_length(:responsible, min: 2)
  end
end

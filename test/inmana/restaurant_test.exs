defmodule Inmana.RestaurantTest do
  @moduledoc """
  Restaurant module tests.
  """
  use Inmana.DataCase

  alias Ecto.Changeset
  alias Inmana.Restaurant

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      # Arrange
      params = %{name: "restaurant", email: "restaurant@restaurant.com"}

      # Act
      result = Restaurant.changeset(params)

      # Assert
      assert %Changeset{
               changes: %{name: "restaurant", email: "restaurant@restaurant.com"},
               valid?: true
             } = result
    end

    test "when params are invalid, returns an invalid changeset" do
      # Arrange
      params = %{name: "r", email: "restaurant.com"}

      # Act
      result = Restaurant.changeset(params)

      # Assert
      assert %Changeset{
               valid?: false
             } = result

      assert errors_on(result) == %{
               email: ["has invalid format"],
               name: ["should be at least 2 character(s)"]
             }
    end
  end
end

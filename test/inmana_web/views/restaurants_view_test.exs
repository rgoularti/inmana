defmodule InmanaWeb.RestaurantsViewTest do
  @moduledoc """
  RestaurantsView module tests.
  """
  use InmanaWeb.ConnCase

  import Phoenix.View

  alias Inmana.Restaurant
  alias InmanaWeb.RestaurantsView

  describe "render/2" do
    test "renders create.json" do
      # Arrange
      params = %{name: "restaurant", email: "restaurant@restaurant.com"}
      {:ok, restaurant} = Inmana.create_restaurant(params)

      # Act
      result = render(RestaurantsView, "create.json", restaurant: restaurant)

      # Assert
      assert %{
               message: "Restaurant created!",
               restaurant: %Restaurant{
                 email: "restaurant@restaurant.com",
                 id: _id,
                 name: "restaurant"
               }
             } = result
    end
  end
end

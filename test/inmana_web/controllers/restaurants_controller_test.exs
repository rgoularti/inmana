defmodule InmanaWeb.RestaurantsControllerTest do
  @moduledoc """
  RestaurantsController module tests.
  """
  use InmanaWeb.ConnCase

  describe "create/2" do
    test "when all params are valid, creates a restaurant", %{conn: conn} do
      # Arrange
      params = %{name: "restaurant", email: "restaurant@restaurant.com"}

      # Act
      result =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:created)

      # Assert
      assert %{
               "message" => "Restaurant created!",
               "restaurant" => %{
                 "email" => "restaurant@restaurant.com",
                 "id" => _id,
                 "name" => "restaurant"
               }
             } = result
    end

    test "when params are invalid, returns an error", %{conn: conn} do
      # Arrange
      params = %{name: "", email: "restaurant.com"}

      # Act
      result =
        conn
        |> post(Routes.restaurants_path(conn, :create, params))
        |> json_response(:bad_request)

      # Assert
      assert result == %{
               "message" => %{"email" => ["has invalid format"], "name" => ["can't be blank"]}
             }
    end
  end
end

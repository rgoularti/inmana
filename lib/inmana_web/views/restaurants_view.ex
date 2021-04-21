defmodule InmanaWeb.RestaurantsView do
  @moduledoc """
  Inmana Restaurants view.
  """
  use InmanaWeb, :view

  def render("create.json", %{restaurant: restaurant}) do
    %{
      message: "Restaurant created!",
      restaurant: restaurant
    }
  end
end

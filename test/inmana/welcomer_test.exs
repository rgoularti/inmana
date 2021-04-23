defmodule Inmana.WelcomerTest do
  @moduledoc """
  Welcomer module tests.
  """
  use ExUnit.Case

  alias Inmana.Welcomer

  describe "welcome/1" do
    test "when the user name is 'Rodrigo' and user age is '30', returns an admin welcome message" do
      # Arrange
      params = %{"name" => "rOdrIgO", "age" => "30"}

      # Act
      result = Welcomer.welcome(params)

      # Assert
      assert result == {:ok, "Welcome to Inmana!\n\nName: Rodrigo\nAge: 30\nRole: ADMIN"}
    end

    test "when user age is greater than or equal 18, returns an user welcome message" do
      # Arrange
      params = %{"name" => "rOdrIgO", "age" => "18"}

      # Act
      result = Welcomer.welcome(params)

      # Assert
      assert result == {:ok, "Welcome to Inmana!\n\nName: Rodrigo\nAge: 18\nRole: USER"}
    end

    test "when user age is less than 18, returns an access restricted message" do
      # Arrange
      params = %{"name" => "rOdrIgO", "age" => "15"}

      # Act
      result = Welcomer.welcome(params)

      # Assert
      assert result ==
               {:error, "Access restricted. You should have 18+ years old to access Inmana. =("}
    end
  end
end

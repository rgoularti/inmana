defmodule Inmana.Welcomer do
  @moduledoc """
  A module to welcome Inmana users.
  """

  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.capitalize()
    |> evaluate(age)
  end

  defp evaluate("Rodrigo", 30) do
    {:ok, "Welcome to Inmana!\n\nName: Rodrigo\nAge: 30\nRole: ADMIN"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome to Inmana!\n\nName: #{name}\nAge: #{age}\nRole: USER"}
  end

  defp evaluate(_name, _age) do
    {:error, "Access restricted. You should have 18+ years old to access Inmana. =("}
  end
end

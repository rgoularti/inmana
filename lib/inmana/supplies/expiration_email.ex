defmodule Inmana.Supplies.ExpirationEmail do
  @moduledoc """
  Module that creates an expiration email from a list of supplies.
  """
  import Bamboo.Email

  alias Inmana.Supply

  def create(to_email, expired_supplies) do
    new_email(
      to: to_email,
      from: "app@inmana.com",
      subject: "Your supplies are about to expire",
      text_body: email_text(expired_supplies)
    )
  end

  defp email_text(expired_supplies) do
    initial_text = "-------- Supplies that are about to expire --------\n"

    Enum.reduce(expired_supplies, initial_text, fn supply, text ->
      text <> supply_string(supply)
    end)
  end

  defp supply_string(%Supply{
         description: description,
         expiration_date: expiration_date,
         responsible: responsible
       }) do
    "Description: #{description}, Expiration Date: #{expiration_date}, Responsible: #{responsible}\n"
  end
end

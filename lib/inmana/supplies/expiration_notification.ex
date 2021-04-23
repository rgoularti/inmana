defmodule Inmana.Supplies.ExpirationNotification do
  @moduledoc """
  Module to notify restaurants about supplies expiration.
  """
  alias Inmana.Mailer
  alias Inmana.Supplies.{ExpirationEmail, GetByExpiration}

  def send do
    data = GetByExpiration.call()

    Enum.each(data, fn {to_email, expired_supplies} ->
      to_email
      |> ExpirationEmail.create(expired_supplies)
      |> Mailer.deliver_later!()
    end)
  end
end

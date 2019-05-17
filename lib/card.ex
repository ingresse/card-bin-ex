defmodule Card do
  @moduledoc """
  Card module
  """

  import Card.Gettext

  alias Card.{
    Brand,
    Error,
    Validate
  }

  @doc """
  Find the best match to a credit_card brand
  """
  def brand_from_number(number) do
    number
    |> match()
    |> format()
    |> respond(number)
  end

  @doc """
  Find the best match to a credit_card brand or raise if not found
  """
  def brand_from_number!(number) do
    case brand_from_number(number) do
      {:ok, card_brand} ->
        card_brand

      {:error, :card_bin, card_number} ->
        raise Error, message: dgettext("card", "invalid card number", number: card_number)
    end
  end

  defp respond(brand, number) when is_nil(brand) do
    {:error, :card_bin, number}
  end

  defp respond(brand, _number) do
    {:ok, brand}
  end

  defp match(number) do
    Enum.find(Brand.options(), fn brand ->
      brand
      |> Brand.data()
      |> Validate.number(number)
    end)
  end

  defp format(brand) when is_nil(brand), do: nil

  defp format(brand) do
    Atom.to_string(brand)
  end
end

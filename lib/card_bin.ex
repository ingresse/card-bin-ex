defmodule CardBinEx do
  @moduledoc """
  Module to discover the CreditCard brand based in the first digits.


  ### Valid CreditCard brands

   | brand            | alias       |
   |------------------|-------------|
   | Visa             | `visa`      |
   | Elo              | `elo`       |
   | JCB              | `jcb`       |
   | Diners           | `diners`    |
   | Discover         | `discover`  |
   | MasterCard       | `master`    |
   | Hipercard        | `hipercard` |
   | American Express | `amex`      |
  """

  import CardBinEx.Gettext

  alias CardBinEx.{
    Brand,
    Error,
    Validate
  }

  defmodule Error do
    @moduledoc """
    Exception reaised if is an invalid creditcard bin
    """
    defexception message: "invalid card"
  end

  @doc """
  Get the creditcard brand base in the first digits.

  ## Examples

      iex> CardBinEx.brand_from_number("4716892")
      {:ok, "visa"}

      iex> CardBinEx.brand_from_number("9716892")
      {:error, :card_brand, "9716892"}

  """
  def brand_from_number(number) do
    number
    |> match()
    |> format()
    |> respond(number)
  end

  @doc """
  Get the creditcard brand base in the first digits and return only the brand.

  ## Examples

        iex> CardBinEx.brand_from_number!("4716892")
        "visa"

        iex> try do
        ...>   CardBinEx.brand_from_number!("9716892")
        ...> rescue
        ...>   e in CardBinEx.Error -> IO.puts(e.message)
        ...> end
        invalid card number
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

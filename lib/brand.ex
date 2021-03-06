defmodule CardBinEx.Brand do
  @moduledoc false

  alias CardBinEx.Brand.{
    Amex,
    Diners,
    Discover,
    Elo,
    Hipercard,
    Jcb,
    Master,
    Visa
  }

  @callback patterns() :: List.t()

  @doc """
  CardBinEx brand options
  """
  def options do
    ~w(
      master
      amex
      elo
      diners
      discover
      jcb
      hipercard
      visa
    )a
  end

  @doc """
  Get the data of the card
  """
  def data(brand) do
    %{
      master: Master,
      amex: Amex,
      elo: Elo,
      diners: Diners,
      discover: Discover,
      jcb: Jcb,
      hipercard: Hipercard,
      visa: Visa
    }
    |> Map.get(brand)
  end
end

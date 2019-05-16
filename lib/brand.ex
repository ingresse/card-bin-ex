defmodule Card.Brand do
  @moduledoc """
  Card Brand module
  """

  alias Card.Brand.{
    Amex,
    Diners,
    Discover,
    Elo,
    Jcb,
    Master,
    Visa
  }

  @callback patterns() :: List.t

  @doc """
  Card brand options
  """
  def options do
    ~w(
      master
      amex
      elo
      diners
      discover
      jcb
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
      visa: Visa
    }
    |> Map.get(brand)
  end
end

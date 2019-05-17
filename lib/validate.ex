defmodule Card.Validate do
  @moduledoc """
  Validations of credit_card brand
  """

  @doc """
  Validate brand for number
  """
  def number(brand, number) do
    brand.patterns()
    |> Enum.find(&match_pattern?(&1, number))
  end

  @doc """
  Check if number match the given pattern
  """
  def match_pattern?(patterns, number) when is_list(patterns) do
    start = Enum.at(patterns, 0)
    finish = Enum.at(patterns, 1)

    length =
      start
      |> Integer.to_string()
      |> String.length()

    slice = String.slice(number, 0..(length - 1))
    card = String.to_integer(slice)

    min = slice_value(start, slice)
    max = slice_value(finish, slice)

    card >= min and card <= max
  end

  def match_pattern?(patterns, number) do
    string = Integer.to_string(patterns)
    left = slice_value(string, number)
    right = slice_value(number, string)

    left == right
  end

  defp slice_value(value, slice) when is_integer(value) do
    length = String.length(slice)

    value
    |> Integer.to_string()
    |> String.slice(0..(length - 1))
    |> String.to_integer()
  end

  defp slice_value(value, slice) do
    length = String.length(slice)

    value
    |> String.slice(0..(length - 1))
    |> String.to_integer()
  end
end

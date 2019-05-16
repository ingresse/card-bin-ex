defmodule Card.Brand.Amex do
  @moduledoc """
  Amex Card Brand
  """

  @behaviour Card.Brand

  @doc false
  def patterns do
    [
      34,
      37
    ]
  end
end

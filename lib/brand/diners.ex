defmodule Card.Brand.Diners do
  @moduledoc """
  Diners Card Brand
  """

  @behaviour Card.Brand

  @doc false
  def patterns do
    [
      [300, 305],
      36,
      38,
      39
    ]
  end
end

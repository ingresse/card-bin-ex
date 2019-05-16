defmodule Card.Brand.Discover do
  @moduledoc """
  Discover Card Brand
  """

  @behaviour Card.Brand

  @doc false
  def patterns do
    [
      6011,
      [644, 649],
      65
    ]
  end
end

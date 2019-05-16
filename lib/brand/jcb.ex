defmodule Card.Brand.Jcb do
  @moduledoc """
  Jcb Card Brand
  """

  @behaviour Card.Brand

  @doc false
  def patterns do
    [
      2131,
      1800,
      [3528, 3589]
    ]
  end
end

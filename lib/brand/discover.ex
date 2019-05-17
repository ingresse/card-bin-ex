defmodule CardBinEx.Brand.Discover do
  @moduledoc false

  @behaviour CardBinEx.Brand

  @doc false
  def patterns do
    [
      6011,
      [644, 649],
      65
    ]
  end
end

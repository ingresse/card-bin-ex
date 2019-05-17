defmodule CardBinEx.Brand.Amex do
  @moduledoc false

  @behaviour CardBinEx.Brand

  @doc false
  def patterns do
    [
      34,
      37
    ]
  end
end

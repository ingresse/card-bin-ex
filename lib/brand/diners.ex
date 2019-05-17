defmodule CardBinEx.Brand.Diners do
  @moduledoc false

  @behaviour CardBinEx.Brand

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

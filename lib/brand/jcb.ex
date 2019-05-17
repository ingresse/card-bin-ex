defmodule CardBinEx.Brand.Jcb do
  @moduledoc false

  @behaviour CardBinEx.Brand

  @doc false
  def patterns do
    [
      2131,
      1800,
      [3528, 3589]
    ]
  end
end

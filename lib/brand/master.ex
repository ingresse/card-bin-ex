defmodule CardBinEx.Brand.Master do
  @moduledoc false

  @behaviour CardBinEx.Brand

  @doc false
  def patterns do
    [
      [51, 55],
      [2221, 2229],
      [223, 229],
      [23, 26],
      [270, 271],
      2720
    ]
  end
end

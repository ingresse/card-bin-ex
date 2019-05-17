defmodule CardBinEx.Brand.Visa do
  @moduledoc false

  @behaviour CardBinEx.Brand

  @doc false
  def patterns do
    [4]
  end
end

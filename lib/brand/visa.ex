defmodule Card.Brand.Visa do
  @moduledoc """
  Visa Card Brand
  """

  @behaviour Card.Brand

  @doc false
  def patterns do
    [4]
  end
end

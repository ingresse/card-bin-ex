defmodule Card.Brand.Master do
  @moduledoc """
  Master Card Brand
  """

  @behaviour Card.Brand

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

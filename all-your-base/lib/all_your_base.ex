defmodule AllYourBase do
  @doc """
  Given a number in input base, represented as a sequence of digits, converts it to output base,
  or returns an error tuple if either of the bases are less than 2
  """

  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(digits, input_base, 10), do: {:ok, [to_decimal(digits, input_base)]}

  def convert(digits, input_base, output_base) do
    number = to_decimal(digits, input_base)
    do_convert(digits, input_base, output_base,[rem(number, output_base)])
  end

  defp do_convert(digits,input_base, output_base,converted) do
    

  end

  defp to_decimal(digits, input_base) do
    n = length(digits)

    for {d, i} <- Enum.with_index(digits), reduce: 0 do
      acc -> d * input_base ** (n - i - 1) + acc
    end
  end
end

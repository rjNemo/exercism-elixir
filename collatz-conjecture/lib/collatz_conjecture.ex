defmodule CollatzConjecture do
  @moduledoc """
  The Collatz Conjecture or 3x+1 problem can be summarized as follows:

  Take any positive integer `n`. If `n` is even, divide `n` by `2` to get `n/2`. If `n` is odd, multiply `n` by `3` and add `1` to get `3n+1`.

  Repeat the process indefinitely. The conjecture states that no matter which number you start with, you will always reach `1` eventually.
  """

  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(1), do: 0
  def calc(input) when input > 0, do: compute(input, 0)

  defp compute(1, steps), do: steps
  defp compute(current, steps) when rem(current, 2) == 0, do: compute(div(current, 2), steps + 1)
  defp compute(current, steps) when rem(current, 2) != 0, do: compute(3 * current + 1, steps + 1)
end

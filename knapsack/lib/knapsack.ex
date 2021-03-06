defmodule Knapsack do
  @doc """
  Return the maximum value that a knapsack can carry.
  """
  @spec maximum_value(items :: [%{value: integer, weight: integer}], maximum_weight :: integer) ::
          integer
  def maximum_value([], _), do: 0

  def maximum_value([%{weight: weight}], maximum_weight)
      when weight > maximum_weight,
      do: 0

  def maximum_value(items, maximum_weight), do: Enum.filter(items, &(&1.weight < maximum_weight))
end

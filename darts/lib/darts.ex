defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position :: position) :: integer
  def score({x, y}) when {x, y} == {0, 0}, do: 10

  def score({x, y}) do
    cond do
      distance_to_center({x, y}) <= 1 -> 10
      distance_to_center({x, y}) <= 5 -> 5
      distance_to_center({x, y}) <= 10 -> 1
      distance_to_center({x, y}) > 10 -> 0
    end
  end

  defp distance_to_center({x, y}), do: :math.sqrt(x ** 2 + y ** 2)
end

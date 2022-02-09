defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search({}, _), do: :not_found
  def search({key}, key), do: {:ok, 0}
  def search(numbers, key), do: search(numbers, key, 0, tuple_size(numbers) - 1)

  defp search(_, _, lo, hi) when hi < lo, do: :not_found

  defp search(numbers, key, lo, hi) do
    mid = lo + div(hi - lo, 2)

    case elem(numbers, mid) do
      ^key -> {:ok, mid}
      result when result > key -> search(numbers, key, lo, mid - 1)
      result when result < key -> search(numbers, key, mid + 1, hi)
    end
  end
end

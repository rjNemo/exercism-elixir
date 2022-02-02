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
  def search({key}, key), do: {:ok, 0}

  def search(numbers, key) do
    count = tuple_size(numbers)
    mid = div(count, 2)
    {left, right} = numbers |> Tuple.to_list() |> Enum.split(mid)

    cond do
      key > List.last(left) -> search(right, key)
      key < hd(right) -> search(left, key)
    end
  end

  # def search(_, _), do: :not_found
end

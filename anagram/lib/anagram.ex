defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates),
    do:
      Enum.filter(
        candidates,
        &(String.downcase(&1) != String.downcase(base) and
            to_graphemes(&1) == to_graphemes(base))
      )

  defp to_graphemes(string), do: String.downcase(string) |> String.graphemes() |> Enum.sort()
end

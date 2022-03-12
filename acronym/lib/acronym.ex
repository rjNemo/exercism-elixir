defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    String.split(string, [" ", "-", "_"])
    |> Enum.map_join(&String.at(&1, 0))
    |> String.upcase()
  end
end

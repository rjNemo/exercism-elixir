defmodule Username do
  @spec sanitize(charlist()) :: charlist()
  def sanitize(''), do: ''

  def sanitize([ch | rest]) do
    convert(ch) ++ sanitize(rest)
  end

  defp convert(ch) do
    case ch do
      ch when ch in ?a..?z -> [ch]
      ?_ -> '_'
      ?ä -> 'ae'
      ?ö -> 'oe'
      ?ü -> 'ue'
      ?ß -> 'ss'
      _ -> ''
    end
  end
end

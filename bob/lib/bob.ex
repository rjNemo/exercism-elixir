defmodule Bob do
  @spec hey(String.t()) :: String.t()
  def hey(input) do
    letter? = &(String.upcase(&1) != String.downcase(&1))
    shouting? = &(&1 == String.upcase(&1) and letter?.(&1))
    question? = &(String.trim(&1) |> String.ends_with?("?"))
    blank? = &(String.trim(&1) == "")

    cond do
      blank?.(input) -> "Fine. Be that way!"
      shouting?.(input) and question?.(input) -> "Calm down, I know what I'm doing!"
      shouting?.(input) -> "Whoa, chill out!"
      question?.(input) -> "Sure."
      true -> "Whatever."
    end
  end
end

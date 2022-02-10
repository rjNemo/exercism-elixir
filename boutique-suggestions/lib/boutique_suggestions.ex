defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    max = Keyword.get(options, :maximum_price, 100)

    for top <- tops,
        bottom <- bottoms,
        top.base_color != bottom.base_color,
        top.price + bottom.price < max do
      {top, bottom}
    end
  end
end

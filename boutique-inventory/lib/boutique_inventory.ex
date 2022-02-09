defmodule BoutiqueInventory do
  def sort_by_price(inventory), do: Enum.sort_by(inventory, & &1.price, &(&1 <= &2))

  def with_missing_price(inventory), do: Enum.filter(inventory, &(&1.price == nil))

  def increase_quantity(%{quantity_by_size: qty} = item, count),
    do: %{item | quantity_by_size: Enum.into(qty, %{}, fn {s, q} -> {s, q + count} end)}

  def total_quantity(%{quantity_by_size: qty}),
    do: Enum.reduce(qty, 0, fn {_, q}, total -> total + q end)
end

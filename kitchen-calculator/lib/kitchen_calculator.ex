defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    case volume_pair do
      {:cup, 1} -> 1
      {:fluid_ounce, 2} -> 2
      {:teaspoon, 3} -> 3
      {:tablespoon, 4} -> 4
      {:milliliter, 5} -> 5
    end
  end

  def to_milliliter(volume_pair) do
    case volume_pair do
      {:milliliter, x} -> {:milliliter, x}
      {:cup, x} -> {:milliliter, 240 * x}
      {:fluid_ounce, x} -> {:milliliter, 30 * x}
      {:teaspoon, x} -> {:milliliter, 5 * x}
      {:tablespoon, x} -> {:milliliter, 15 * x}
    end
  end

  def from_milliliter(volume_pair, unit) do
    {_, x} = volume_pair

    case unit do
      :milliliter -> volume_pair
      :cup -> {unit, x / 240}
      :fluid_ounce -> {unit, x / 30}
      :teaspoon -> {unit, x / 5}
      :tablespoon -> {unit, x / 15}
    end
  end

  def convert(volume_pair, unit) do
    {from, x} = volume_pair

    case {from, unit} do
      {:teaspoon, :tablespoon} -> {unit, x / 3}
      {:cup, :fluid_ounce} -> {unit, x * 8}
      {:fluid_ounce, :teaspoon} -> {unit, x * 6}
      {:tablespoon, :cup} -> {unit, x / 16}
    end
  end
end

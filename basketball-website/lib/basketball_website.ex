defmodule BasketballWebsite do
  def extract_from_path(data, ""), do: data

  def extract_from_path(data, path) do
    [key | rest] = String.split(path, ".", parts: 2)
    extract_from_path(data[key], Enum.join(rest))
  end

  # def do_extract_from_path(data, key) do
  #   data[key]
  # end

  def get_in_path(data, ""), do: data

  def get_in_path(data, path) do
    [key | rest] = String.split(path, ".", parts: 2)
    extract_from_path(Map.get(data, key), Enum.join(rest))
  end
end

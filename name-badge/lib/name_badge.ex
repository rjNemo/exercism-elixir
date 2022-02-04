defmodule NameBadge do
  def print(id, name, nil) do
    if id do
      "[#{id}] - #{name} - OWNER"
    else
      "#{name} - OWNER"
    end
  end

  def print(nil, name, department), do: "#{name} - #{String.upcase(department)}"

  def print(id, name, department), do: "[#{id}] - #{name} - #{String.upcase(department)}"
end

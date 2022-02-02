defmodule RPG.CharacterSheet do
  def welcome(), do: IO.puts("Welcome! Let's fill out your character sheet together.")

  def ask_name(), do: prompt("What is your character's name?")

  def ask_class(), do: prompt("What is your character's class?")

  def ask_level(), do: prompt("What is your character's level?") |> String.to_integer()

  def run() do
    welcome()
    character = %{name: ask_name(), class: ask_class(), level: ask_level()}
    IO.inspect(character, label: "Your character")
  end

  defp prompt(message), do: IO.gets("#{message}\n") |> String.trim()
end

defmodule Rules do
  def eat_ghost?(power_pellet_active, touching_ghost) do
    case {power_pellet_active, touching_ghost} do
      {true, true} -> true
      _ -> false
    end
  end

  def score?(touching_power_pellet, touching_dot) do
    case {touching_power_pellet, touching_dot} do
      {false, false} -> false
      _ -> true
    end
  end

  def lose?(power_pellet_active, touching_ghost) do
    case {power_pellet_active, touching_ghost} do
      {false, true} -> true
      _ -> false
    end
  end

  def win?(has_eaten_all_dots, power_pellet_active, touching_ghost) do
    case {has_eaten_all_dots, power_pellet_active, touching_ghost} do
      {true, false, false} -> true
      {true, false, true} -> false
      {true, true, true} -> true
      _ -> false
    end
  end
end

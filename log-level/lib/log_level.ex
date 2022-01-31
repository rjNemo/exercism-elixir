defmodule LogLevel do
  def to_label(level, legacy?) do
    cond do
      {level, legacy?} == {0, false} -> :trace
      level == 1 -> :debug
      level == 2 -> :info
      level == 3 -> :warning
      level == 4 -> :error
      {level, legacy?} == {5, false} -> :fatal
      true -> :unknown
    end
  end

  def alert_recipient(level, legacy?) do
    cond do
      {level, legacy?} == {0, true} -> :dev1
      level == 4 -> :ops
      {level, legacy?} == {5, false} -> :ops
      {level, legacy?} == {5, true} -> :dev1
      {level, legacy?} == {6, true} -> :dev1
      {level, legacy?} == {6, false} -> :dev2
      true -> nil
    end
  end
end

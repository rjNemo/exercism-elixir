defmodule TakeANumber do
  def start() do
    spawn(fn -> listen(0) end)
  end

  defp listen(state) do
    receive do
      {:report_state, pid} ->
        send(pid, state)
        listen(state)

      {:take_a_number, pid} ->
        send(pid, state + 1)
        listen(state + 1)

      :stop ->
        nil

      _ ->
        listen(state)
    end
  end
end

# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ [name: Plot]) do
    Agent.start_link(fn -> {[], 0} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn {list, _} -> list end)
  end

  def register(pid, register_to) do
    id = Agent.get(pid, fn {_, uid} -> uid end)

    plot = %Plot{plot_id: id, registered_to: register_to}
    Agent.update(pid, fn {list, id} -> {[plot | list], id + 1} end)
    plot
  end

  def release(pid, plot_id) do
    Agent.update(pid, fn {list, id} ->
      {Enum.filter(
         list,
         fn %Plot{plot_id: id} -> plot_id != id end
       ), id}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, fn {list, _} ->
      res =
        Enum.filter(
          list,
          fn %Plot{plot_id: id} -> plot_id == id end
        )

      case res do
        [] -> {:not_found, "plot is unregistered"}
        _ -> hd(res)
      end
    end)
  end
end

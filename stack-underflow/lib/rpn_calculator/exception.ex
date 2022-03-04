defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    defexception message: "stack underflow occurred"

    @impl true
    def exception(context) do
      case context do
        [] -> %__MODULE__{}
        _ -> %__MODULE__{message: "stack underflow occurred, context: #{context}"}
      end
    end
  end

  def divide([]), do: raise(StackUnderflowError, "when dividing")
  def divide([_]), do: raise(StackUnderflowError, "when dividing")
  def divide([0 | _]), do: raise(DivisionByZeroError)
  def divide([denom, num]), do: div(num, denom)
end

defmodule TopSecret do
  def to_ast(string), do: Code.string_to_quoted!(string)

  def decode_secret_message_part(ast, acc) do
    case ast do
      {:def, _, [{_, _, nil} | _]} ->
        {ast, [""] ++ acc}

      {:def, _, [{name, _, args} | _]} ->
        {ast, [String.slice(to_string(name), 0, length(args))] ++ acc}

      {:defp, _, [{_, _, nil} | _]} ->
        {ast, [""] ++ acc}

      {:defp, _, [{name, _, args} | _]} ->
        {ast, [String.slice(to_string(name), 0, length(args))] ++ acc}

      _ ->
        {ast, acc}
    end
  end

  def decode_secret_message(string) do
    # Please implement the decode_secret_message/1 function
  end
end

# Создайте функцию collect_module_stats принимающую строку, в которой определяется модуль и функции модуля, а затем подсчитывается статистика по функциям, определенные внутри модуля.

defmodule Ast do
  def collect_module_stats(string) do
    {:ok, ast} = Code.string_to_quoted(string)

    {_, functions} =
      Macro.prewalk(ast, [], fn
        {:def, _, [{name, _, args}, _]} = node, acc ->
          arity = length(args || [])
          {node, [%{name: name, arity: arity} | acc]}

        {:defp, _, [{name, _, args}, _]} = node, acc ->
          arity = length(args || [])
          {node, [%{name: name, arity: arity} | acc]}

        node, acc ->
          {node, acc}
      end)
      
    functions
  end
end

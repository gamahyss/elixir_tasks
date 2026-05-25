# Создайте макрос with_logging, который принимает функцию, логгирует результат выполнения и возвращает результат.

defmodule Solution do
  defmacro with_logging(do: block) do
    quote do
      IO.puts("Started execution...")

      result = unquote(block).()

      IO.puts("Execution result is: #{inspect(result)}")

      result
    end
  end
end

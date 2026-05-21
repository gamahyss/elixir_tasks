# Создайте макрос my_unless, который повторяет семантику unless

defmodule Macros2 do
  defmacro my_unless(condition, do: block) do
    quote do
      if !unquote(condition) do
        unquote(block)
      end
    end
  end
end

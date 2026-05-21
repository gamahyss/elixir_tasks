# Создайте макрос my_abs, который берет абсолютное значение переданного аргумента (поможет функция abs)

defmodule Macros do
  defmacro my_abs(value) do
    quote do
      abs(unquote(value))
    end
  end
end

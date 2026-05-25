# Определите внутри модуля следующие атрибуты со значениями:

# Атрибут: number_attr, значение: 10
# Атрибут: boolean_attr, значение: false
# Атрибут: hello_world_attr, значение: "Hello, World!"

defmodule Attributes do
  defmacro __using__(_) do
    quote do
      @number_attr 10
      @boolean_attr false
      @hello_world_attr "Hello, World!"
    end
  end
end

# Определите три структуры Human, Dog и Cat с полем name. Затем определите функцию say_something для протокола Teller для каждого из модулей, которая возвращает строку в зависимости от типа:

# Для Human Hello, world!
# Для Cat Meow, world!
# Для Dog Bark, world!

defprotocol Teller do
  @spec say_something(any()) :: String.t()
  def say_something(someone)
end

defmodule Human do
  defstruct name: ""
end

defmodule Dog do
  defstruct name: ""
end

defmodule Cat do
  defstruct name: ""
end

defimpl Teller, for: Human do
  def say_something(_human) do
    "Hello, world!"
  end
end

defimpl Teller, for: Dog do
  def say_something(_dog) do
    "Bark, world!"
  end
end

defimpl Teller, for: Cat do
  def say_something(_cat) do
    "Meow, world!"
  end
end

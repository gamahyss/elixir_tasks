# Реализуйте функцию print_twice(value), которая печатает на экран переданное значение два раза

#Solution.print_twice("WoW")
# => WoW
# => WoW

defmodule Functions do
  # BEGIN (write your solution here)
  def print_twice(text) do
    IO.puts(text)
    IO.puts(text)
  end
  # END
end

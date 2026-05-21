# Реализуйте функцию join_and_upcase, которая принимает две строки, соединяет их вместе, удаляет пробелы в начале и в конце, и переводит в верхний регистр только символы латинского алфавита.

# Solution.join_and_upcase(" привет ", "world!")
# => "привет WORLD!"

# Solution.join_and_upcase("hello ", "мир!  ")
# => "HELLO мир!"

defmodule Strings do
  # BEGIN (write your solution here)
  def join_and_upcase(a, b) do
    a = String.trim(a)
    b = String.trim(b)
    a = String.upcase(a, :ascii)
    b = String.upcase(b, :ascii)
    a <> " " <> b
  end
  # END
end

# Создайте сигиль ~i который переводит переданную в него строку в целое число и если указан модификатор n, который переводит переданное строку-число в отрицательное:

# import Solution

# ~i(40)
# => 40

# ~i(21)n
# => -21
# Для перевода строки в число воспользуйтесь функцией to_integer из модуля String.

defmodule Sigils do
  # BEGIN (write your solution here)
  def sigil_i(string, []), do: String.to_integer(string)
  def sigil_i(string, [?n]), do: String.to_integer(string) * -1
  # END
end

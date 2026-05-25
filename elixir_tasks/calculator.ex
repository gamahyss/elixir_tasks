# Даны два целых числа. Создайте простой калькулятор, который поддерживает следующие операции: сложение, вычитание, деление, умножение.

defmodule Calculator do
  # BEGIN (write your solution here)
  def calculate(s, a, b) do
    case s do
      "+" -> a + b
      "-" -> a - b
      "*" -> a * b
      "/" -> a / b
    end
  end
  # END
end

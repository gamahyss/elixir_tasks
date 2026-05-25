# Создайте функцию my_div, которая выбрасывает исключение ArgumentError с сообщением Divide x by zero is prohibited!, где x - первый переданный аргумент

defmodule Exceptions do
  def my_div(x, y) do
    if y == 0 do
      raise ArgumentError, "Divide #{x} by zero is prohibited!"
    else
      Integer.floor_div(x, y)
    end
  end
end

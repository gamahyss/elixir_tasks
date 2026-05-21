# Реализуйте функцию inc_numbers, которая берёт из переданного списка значения, являющиеся числами is_number и возвращает список этих чисел, увеличив каждое число на единицу

defmodule Filtration do
  def inc_numbers(list) do
    list
    |> Enum.filter(&is_number/1)
    |> Enum.map(fn number -> number + 1 end)
  end
end

# Реализовать функцию get_values(data), которая принимает словарь, извлекает из него два значения по ключам :a и :b, и возвращает их в виде кортежа {a_value, b_value}.

# Реализовать функцию get_value_by_key(data, key), которая принимает словарь и ключ, извлекает значение по указанному ключу и возвращает его.

# Обе функции генерируют исключение MatchError если в словаре нет нужных ключей.

defmodule PatternMatchingForMaps do
  # BEGIN (write your solution here)
  def get_values(data) do
    %{a: a_value, b: b_value} = data
    {a_value, b_value}
  end

  def get_value_by_key(data, key) do
    %{^key => value} = data
    value
  end
  # END
end

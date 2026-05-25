# Реализуйте функцию max_delta, которая должна принимать два списка чисел и вычислять максимальную разницу (абсолютное значение разницы) между соответствующими парами элементов. Примеры:

# Solution.max_delta([], [])
# => 0
# Solution.max_delta([10, -15, 35], [2, -12, 42])
# => 8
# Solution.max_delta([-5], [-15])
# => 10
# Вам пригодятся функции abs и max:

# abs(42)    # => 42
# abs(-13)   # => 13
# max(1, 5)  # => 5

defmodule MaxDelta do
  def max_delta(list1, list2) do
    list1
    |> Enum.zip(list2)
    |> Enum.reduce(0, fn {a, b}, acc ->
      max(acc, abs(a - b))
    end)
  end
end

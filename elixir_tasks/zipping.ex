# Реализуйте функцию zip, которая группирует элементы переданных векторов в подвектора. Если вектора отличаются длиной, то вместо сгруппированного элемента оставьте nil. Для обращения к элементу списка по индексу используйте Enum.at

defmodule Zipping do
  def zip(list1, list2) do
    max_length =
      max(length(list1), length(list2))

    zip_items(list1, list2, 0, max_length)
  end

  defp zip_items(_list1, _list2, index, max_length)
       when index >= max_length do
    []
  end

  defp zip_items(list1, list2, index, max_length) do
    [
      [
        Enum.at(list1, index),
        Enum.at(list2, index)
      ]
      | zip_items(list1, list2, index + 1, max_length)
    ]
  end
end

# Реализовать функцию range(from, to), которая принимает два числа, задающих диапазон, и возвращает список, заполненный числами в этом диапазоне, from и to включительно

defmodule Recursion do
  def range(from, to) when from > to, do: []

  def range(from, to) do
    [from | range(from + 1, to)]
  end
end

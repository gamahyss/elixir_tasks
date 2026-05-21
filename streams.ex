# Создайте функцию generate, которая случайно генерирует бесконечную последовательность чисел от 1 до 20 и берет n элементов от этой коллекции

defmodule Streams do
  def generate(n) do
    Stream.repeatedly(fn ->
      Enum.random(1..20)
    end)
    |> Enum.take(n)
  end
end

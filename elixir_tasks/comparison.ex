# Реализуйте функцию compare, которая сравнивает два переданных числа

defmodule Comparison do
  def compare(a, b) when is_number(a) and is_number(b) do
    cond do
      a < b -> {:ok, :less}
      a == b -> {:ok, :equal}
      a > b -> {:ok, :greater}
    end
  end

  def compare(_, _), do: {:error, :not_number}
end

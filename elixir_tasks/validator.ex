# Реализуйте функцию validate, которая проверяет переданный аргумент на следующие условия:

# аргумент является строкой
# длина строки меньше или равна 8
# длина строки больше или равна 2

defmodule Validator do
  def validate(value) when not is_binary(value) do
    {:error, :not_binary}
  end

  def validate(value) do
    cond do
      String.length(value) < 2 ->
        {:error, :too_short}

      String.length(value) > 8 ->
        {:error, :too_long}

      true ->
        {:ok, value}
    end
  end
end

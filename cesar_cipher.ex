# Реализуем шифр Цезаря -- простой способ шифрования путем сдвига каждого символа на константу.

# Нужно реализовать функцию encode/2, которая принимает набор символов (charlists) и сдвиг, и возвращает зашифрованный набор символов (charlists).

# Solution.encode('Hello', 10)
# => 'Rovvy'
# Solution.encode('Hello', 5)
# => 'Mjqqt'
# Также нужно реализовать функцию decode/2, которая принимает зашифрованную набор символов (charlists) и сдвиг, и возвращает оригинальный набор символов (charlists).

defmodule CesarCipher do
  def encode(text, shift) do
    Enum.map(text, fn char ->
      char + shift
    end)
  end

  def decode(text, shift) do
    Enum.map(text, fn char ->
      char - shift
    end)
  end
end

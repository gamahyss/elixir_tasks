# Создайте макрос prohibit_words, генерирующий функцию forbidden?, в который передается список запрещенных слов и проверяется, запрещено ли слово, переданное в функцию forbidden?. Если передано не слово, то функция возвращает false

defmodule Macros3 do
  defmacro prohibit_words(words) do
    quote do
      def forbidden?(word) when is_binary(word) do
        word in unquote(words)
      end

      def forbidden?(_), do: false
    end
  end
end

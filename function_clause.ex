# Реализовать функцию valid_game?(state), которая получает на вход состояние игры, и проверяет, является ли это состояние валидным. То есть, имеет ли состояние правильную структуру, и заполнены ли ячейки только валидными значениями. Функция возвращает булевое значение.

# Реализовать функцию check_who_win(state), которая получает состояние и возвращает победителя, если он есть. Функция должна определить наличие трех крестиков или трех ноликов по горизонтали, или по вертикали, или по диагонали. В случае победы крестиков функция возвращает {:win, :x}, в случае победы ноликов функция возвращает {:win, :o}, если победы нет, функция возвращает :no_win.

defmodule FunctionClause do
  @valid_values [:x, :o, :f]

  def valid_game?(state) do
    case state do
      {
        {a1, a2, a3},
        {b1, b2, b3},
        {c1, c2, c3}
      } ->
        Enum.all?(
          [a1, a2, a3, b1, b2, b3, c1, c2, c3],
          fn cell -> cell in @valid_values end
        )

      _ ->
        false
    end
  end

  def check_who_win(state) do
    case state do
      {
        {a1, a2, a3},
        {b1, b2, b3},
        {c1, c2, c3}
      } ->

        lines = [
          [a1, a2, a3],
          [b1, b2, b3],
          [c1, c2, c3],

          [a1, b1, c1],
          [a2, b2, c2],
          [a3, b3, c3],

          [a1, b2, c3],
          [a3, b2, c1]
        ]

        cond do
          Enum.any?(lines, fn line -> line == [:x, :x, :x] end) ->
            {:win, :x}

          Enum.any?(lines, fn line -> line == [:o, :o, :o] end) ->
            {:win, :o}

          true ->
            :no_win
        end

      _ ->
        :no_win
    end
  end
end

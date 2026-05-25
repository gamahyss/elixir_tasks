# Реализовать функцию join_game(user), которая принимает игрока в виде кортежа {:user, name, age, role} и определяет, разрешено ли данному игроку подключиться к игре. Если игроку уже исполнилось 18 лет, то он может войти в игру. Если роль игрока :admin или :moderator, то он может войти в игру независимо от возраста. Функция должна вернуть :ok или :error.

# Реализовать функцию move_allowed?(current_color, figure) которая определяет, разрешено ли данной шахматной фигуре сделать ход. Параметр current_color может быть либо :white либо :black, и он указывает, фигурам какого цвета разрешено сделать ход. Параметр figure представлен кортежем {type, color}, где type может быть один из: :pawn, :rock, :bishop, :knight, :queen, :king, а color может быть :white или :black. Фигура может сделать ход если её тип :pawn или :rock и её цвет совпадает с current_color. Функция должна вернуть true или false.

defmodule CaseConstruction do
  # BEGIN (write your solution here)
  def join_game(user) do
    case user do
      {:user, name, age, role} when age >= 18 or role == :admin or role == :moderator -> :ok
      {:user, name, age, role} when age < 18 and role != :admin and role != :moderator -> :error
    end
  end

  def move_allowed?(current_color, figure) do
    case figure do
      {type, color} when color == current_color ->
        case type do
          :rock -> true
          :pawn -> true
          :bishop -> false
          :knight -> false
          :king -> false
          :queen -> false
        end
      {type, color} when color != current_color -> false
    end
  end
  # END
end

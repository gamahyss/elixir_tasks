# Создайте функцию calculate_stats, которая подсчитывает, сколько в списке людей и питомцев

defmodule User do
  defstruct name: "John"
end

defmodule Pet do
  defstruct name: "Barkley"
end

defmodule CalculateStats do
  # BEGIN
  def calculate_stats(users_and_pets) do
    Enum.reduce(users_and_pets, %{humans: 0, pets: 0}, fn item, acc ->
      case item do
        %User{} ->
          %{acc | humans: acc.humans + 1}

        %Pet{} ->
          %{acc | pets: acc.pets + 1}
      end
    end)
  end
  # END
end

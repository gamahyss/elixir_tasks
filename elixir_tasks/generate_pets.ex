# Создайте функцию generate_pets, в которую передается количество питомцев, список которых нужно сгенерировать с именем Barkley x, где x - идентификатор питомца (отсчет идет с нуля). Модуль Pet описан заранее

defmodule Pet do
  @type pet :: %__MODULE__{name: String.t()}

  defstruct name: "Barkley"
end

defmodule GeneratePets do
  # BEGIN
  @spec generate_pets(integer()) :: list(Pet.pet())

  def generate_pets(count) when count <= 0, do: []

  def generate_pets(count) do
    Enum.map(0..(count - 1), fn id ->
      %Pet{name: "Barkley #{id}"}
    end)
  end
  # END
end

# Создайте функцию fetch_gamers, которая принимает список сотрудников и выводит список активных сотрудников (статус :active) сотрудников у которых хобби связаны с играми (тип хобби :gaming)

defmodule FetchGamers do
  def fetch_gamers(employees) do
    employees
    |> Enum.filter(fn employee ->
      employee.status == :active
    end)
    |> Enum.flat_map(fn employee ->
      employee.hobbies
      |> Enum.filter(fn hobby ->
        hobby.type == :gaming
      end)
      |> Enum.map(fn hobby ->
        {employee.name, hobby}
      end)
    end)
  end
end

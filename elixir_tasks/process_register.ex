# Допишите агента, добавив функции add, drop для регистрации/снятия процессов с учета и функцию list_registered, которая выводит список процессов, зарегистрированных через агента. Если процесс завершился, то при вызове add регистрировать процесс не нужно. Если удаляемый процесс не существует, то нужно вернуть :ok, учтите, что Process.unregister вызывает исключение при попытке удалить несуществующий процесс.

defmodule ProcessRegister do
  use Agent

  def start_link(initial_value \\ %{}) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def add(pid, name) do
    if Process.alive?(pid) do
      Agent.update(__MODULE__, fn state ->
        Map.put(state, name, pid)
      end)

      :ok
    else
      :ok
    end
  end

  def drop(name) do
    Agent.update(__MODULE__, fn state ->
      Map.delete(state, name)
    end)

    :ok
  end

  def list_registered do
    Agent.get(__MODULE__, fn state -> state end)
  end
end

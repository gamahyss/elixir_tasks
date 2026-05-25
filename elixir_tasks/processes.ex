# Создайте функцию run_in_process, которая принимает функцию и создает процесс, который выполняет эту функцию

defmodule Processes do
  def run_in_process(fun) when is_function(fun, 0) do
    spawn(fn -> fun.() end)
  end
end

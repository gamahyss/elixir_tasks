# В этот раз допишите функции агента Accumulator, используя модуль Task и опираясь на модуль Calculator:

# add прибавить к состоянию аккумулятора переданное число;
# sub вычесть состояние аккумулятора на переданное число;
# mul умножить состояние аккумулятора на переданное число;
# div разделить состояние аккумулятора на переданное число;
# reset сбрасывает состояние Accumulator в ноль;
# current возвращает нынешнее состояние Accumulator.

defmodule Calculator do
  def exec(:+, a, b), do: a + b
  def exec(:-, a, b), do: a - b
  def exec(:*, a, b), do: a * b
  def exec(:/, a, b), do: div(a, b)
end

defmodule Accumulator do
  use Agent

  def start_link(initial_value) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def add(value) do
    Agent.update(__MODULE__, fn state ->
      Calculator.exec(:+, state, value)
    end)

    :ok
  end

  def sub(value) do
    Agent.update(__MODULE__, fn state ->
      Calculator.exec(:-, state, value)
    end)

    :ok
  end

  def mul(value) do
    Agent.update(__MODULE__, fn state ->
      Calculator.exec(:*, state, value)
    end)

    :ok
  end

  def div(value) do
    Agent.update(__MODULE__, fn state ->
      Calculator.exec(:/, state, value)
    end)

    :ok
  end

  def reset do
    Agent.update(__MODULE__, fn _ -> 0 end)
    :ok
  end

  def current do
    Agent.get(__MODULE__, fn state -> state end)
  end
end

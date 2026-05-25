# Супервизоры могут задаваться через модули, для этого нужно в модуле использовать поведение Supervisor и определить функцию обратного вызова init/1, которая будет вызвана при запуске супервизора через start_link. В файле с решением описано два агента, ваша задача дописать модуль Solution, добавив две функции:

# start_link - функция для запуска супервизора из модуля
# init - функция, которая запустится перед стартом супервизора, в неё передается список потомков, стратегия перезапуска и т.д.
# В функции init сделайте потомками Decrementor и Incrementor, а в стратегии перезапуска укажите :one_for_one.

defmodule Decrementor do
  use Agent

  def start_link(initial_state \\ 0) do
    Agent.start_link(fn -> initial_state end, name: __MODULE__)
  end

  def current_value, do: Agent.get(__MODULE__, fn state -> state end)
  def run, do: Agent.update(__MODULE__, fn state -> state - 1 end)
end

defmodule Incrementor do
  use Agent

  def start_link(initial_state \\ 0) do
    Agent.start_link(fn -> initial_state end, name: __MODULE__)
  end

  def current_value, do: Agent.get(__MODULE__, fn state -> state end)
  def run, do: Agent.update(__MODULE__, fn state -> state + 1 end)
end

defmodule Solution do
  use Supervisor

  # BEGIN
  def start_link(init_args \\ %{}) do
    Supervisor.start_link(__MODULE__, init_args, name: __MODULE__)
  end

  def init(_init_args) do
    children = [
      {Incrementor, 0},
      {Decrementor, 0}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end

  # END
end

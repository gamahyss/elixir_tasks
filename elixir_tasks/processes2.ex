# В файле с решением описан модуль Worker. Для работы с ним, нужно создать и связать процесс с этим модулем следующим образом:

# number = 5
# spawn_link(fn -> Worker.work(number) end)
# После этого, Worker проверяет число по правилам классической задачи с собеседований FooBar и процесс завершается с соответствующим сигналом:

# число кратно 3 и 5 - :foobar;
# число кратно 3 - :foo;
# число кратно 3 - :bar;
# в ином случае процесс завершается в штатном режиме :normal.
# Создайте функцию supervise_foobar которая принимает число, вызывает Worker и на основе сигнала о завершении формирует строку, где вместо переданного числа подставляется Foo, Bar, FooBar либо ничего, затем число увеличивается на единицу и процесс проверки числа и сбора строки идет дальше.

# Если переданное число больше 100 или меньше 1, то продолжать сбор строки не нужно. Не забудьте о Process.flag(:trap_exit, true), так как иначе не получится собрать информацию о сигналах завершения Worker

defmodule Worker do
  def work(number) do
    cond do
      rem(number, 3) == 0 && rem(number, 5) == 0 -> exit(:foobar)
      rem(number, 3) == 0 -> exit(:foo)
      rem(number, 5) == 0 -> exit(:bar)
      true -> exit(:normal)
    end
  end
end

defmodule Solution do
  def supervise_foobar(number) when number < 1 or number > 100 do
    ""
  end

  def supervise_foobar(number) do
    Process.flag(:trap_exit, true)
    loop(number, [])
  end

  defp loop(number, acc) when number < 1 or number > 100 do
    Enum.join(Enum.reverse(acc), " ")
  end

  defp loop(number, acc) do
    pid =
      spawn_link(fn ->
        Worker.work(number)
      end)

    new_acc =
      receive do
        {:EXIT, ^pid, reason} ->
          case reason do
            :foo -> ["Foo" | acc]
            :bar -> ["Bar" | acc]
            :foobar -> ["FooBar" | acc]
            :normal -> acc
          end
      end

    loop(number + 1, new_acc)
  end
end

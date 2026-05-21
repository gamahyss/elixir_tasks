# Создайте функцию hours_to_milliseconds которая конвертирует часы в миллисекунды, обратите внимание на :timer библиотеку из Erlang:

# Solution.hours_to_milliseconds(0)
# => 0
# Solution.hours_to_milliseconds(1.5)
# => 5400000.0
# Solution.hours_to_milliseconds(2)
# => 7200000

defmodule Interop do
  # BEGIN (write your solution here)
  def hours_to_milliseconds(n) do
    :timer.hours(n)
  end
  # END
end

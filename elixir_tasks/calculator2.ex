# Создайте функцию calculate которая принимает процесс-получатель и поддерживает операции :+, :-, :* в виде сообщений от процесса и при обработке возвращает сообщение процессу отправителю с результатом, функция должна поддерживать постоянную обработку сообщений. При передаче сообщения :exit, функция перестает обрабатывать входящие сообщения

defmodule Calculator2 do
  def calculate(receiver) do
    receive do
      {:+, [a, b]} ->
        send(receiver, {:ok, a + b})
        calculate(receiver)

      {:-, [a, b]} ->
        send(receiver, {:ok, a - b})
        calculate(receiver)

      {:*, [a, b]} ->
        send(receiver, {:ok, a * b})
        calculate(receiver)

      {:exit} ->
        send(receiver, {:ok, :exited})
        :ok
    end
  end
end

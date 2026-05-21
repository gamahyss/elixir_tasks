# В этот раз создайте процесс кеш-сервер, который хранит в состоянии словарь. Напишите функцию init, которая принимает родительский процесс и начальное состояние (как в примерах выше). Затем добавьте обработку следующих сообщений:

# :put положить по переданному ключу key значение value в состояние кеш-сервера, возвращает кортеж {:ok, value};
# :get достать из состояния процесса значение по переданному ключу, при отсутствии значения вернуть кортеж {:error, :not_found};
# :drop убрать из состояния процесса переданный ключ;
# :exit перестать обрабатывать входящие сообщения кеш-сервером, возвращает кортеж {:ok, :exited};
# а еще добавьте обработку невалидных сообщений, чтобы процесс не ломался, если ему передать что-то не то (вернуть кортеж {:error, :unrecognized_operation}).

defmodule CacheServer do
  def init(parent, state \\ %{}) do
    loop(parent, state)
  end

  defp loop(parent, state) do
    receive do
      {:put, {key, value}} ->
        new_state = Map.put(state, key, value)
        send(parent, {:ok, value})
        loop(parent, new_state)

      {:get, {key}} ->
        case Map.fetch(state, key) do
          {:ok, value} ->
            send(parent, {:ok, value})
            loop(parent, state)

          :error ->
            send(parent, {:error, :not_found})
            loop(parent, state)
        end

      {:drop, {key}} ->
        new_state = Map.delete(state, key)
        send(parent, {:ok, key})
        loop(parent, new_state)

      {:exit} ->
        send(parent, {:ok, :exited})
        :ok

      _ ->
        send(parent, {:error, :unrecognized_operation})
        loop(parent, state)
    end
  end
end

# В функции filter_adults/1 критерием фильтрации является возраст пользователя. Но этот возраст явно указан в коде функции. Нужно реализовать функцию filter_by_age/2, которая принимает список пользователей и возраст.

defmodule RecursionFunctions do
  def filter_by_age(users, min_age) do
    Enum.filter(users, fn {:user, _id, _name, age} ->
      age > min_age
    end)
  end
end

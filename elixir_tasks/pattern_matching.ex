# Реализуйте функцию get_age(user), которая принимает объект user, представленный в виде кортежа {:user, name, age}, и возвращает возраст (age).

# Реализуйте функцию get_names(users), которая принимает список из трёх объектов user, представленных такими же кортежами, и возвращает список из трёх имен.

defmodule PatternMatching do
  # BEGIN (write your solution here)
  def get_age(user) do
    {:user, name, age} = user
    age
  end

  def get_names(users) do
    [user1, user2, user3] = users
    {:user, name1, age1} = user1
    {:user, name2, age2} = user2
    {:user, name3, age3} = user3
    [name1, name2, name3]
  end
  # END
end

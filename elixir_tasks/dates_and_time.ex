# Создайте функцию shift_days, которая принимает структуры Time, DateTime, NaiveDateTime, Date и смещает ее на количество переданных дней. Дни могут быть отрицательным числом

defmodule DatesAndTime do
  def shift_days(%Date{} = date, days) do
    Date.add(date, days)
  end

  def shift_days(%NaiveDateTime{} = datetime, days) do
    NaiveDateTime.add(datetime, days * 86_400, :second)
  end

  def shift_days(%DateTime{} = datetime, days) do
    DateTime.add(datetime, days * 86_400, :second)
  end

  def shift_days(%Time{} = time, _days) do
    time
  end
end

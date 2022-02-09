defmodule LibraryFees do
  def datetime_from_string(string), do: NaiveDateTime.from_iso8601!(string)

  def before_noon?(datetime), do: datetime.hour < 12

  def return_date(checkout_datetime) do
    delay = if before_noon?(checkout_datetime), do: 28, else: 29
    Date.add(checkout_datetime, delay)
  end

  def days_late(planned_return_date, actual_return_datetime) do
    case Date.compare(planned_return_date, actual_return_datetime) do
      :lt -> -Date.diff(planned_return_date, actual_return_datetime)
      _ -> 0
    end
  end

  def monday?(datetime), do: Date.day_of_week(datetime) == 1

  def calculate_late_fee(checkout, return, rate) do
    ret_date = datetime_from_string(checkout) |> return_date()
    delay = days_late(ret_date, datetime_from_string(return))

    if monday?(datetime_from_string(return)) do
      div(delay * rate, 2)
    else
      delay * rate
    end
  end
end

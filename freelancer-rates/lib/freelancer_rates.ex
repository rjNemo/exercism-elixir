defmodule FreelancerRates do
  def daily_rate(hourly_rate), do: 8.0 * hourly_rate

  def apply_discount(before_discount, discount), do: before_discount * (100 - discount) / 100

  def monthly_rate(hourly_rate, discount),
    do: (22 * daily_rate(hourly_rate)) |> apply_discount(discount) |> Float.ceil() |> trunc()

  def days_in_budget(budget, hourly_rate, discount),
    do: (budget / (daily_rate(hourly_rate) |> apply_discount(discount))) |> Float.floor(1)
end

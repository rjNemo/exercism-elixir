defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add({an, ad}, {bn, bd}) do
    ratio =
      if ad == bd do
        {an + bn, ad}
      else
        {an * bd + bn * ad, ad * bd}
      end

    case ratio do
      {0, _} -> {0, 1}
      _ -> ratio
    end
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract({an, ad}, {bn, bd}) do
    ratio =
      if ad == bd do
        {an - bn, ad}
      else
        {an * bd - bn * ad, ad * bd}
      end

    case ratio do
      {0, _} -> {0, 1}
      _ -> ratio
    end
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply({an, ad}, {bn, bd}) do
    n = an * bn
    d = ad * bd

    reduce({n, d})
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(a, {bn, bd}), do: multiply(a, {bd, bn})

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs({n, d} = a) do
    cond do
      n * d > 0 && n > 0 -> a
      n * d > 0 && n < 0 -> {-n, -d}
      n * d < 0 && n > 0 -> {n, -d}
      n * d < 0 && n < 0 -> {-n, d}
      true -> a
    end
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational({x, y}, n) do
    cond do
      n >= 0 -> {x ** n, y ** n}
      n < 0 && x > 0 -> {y ** -n, x ** -n}
      n < 0 && x < 0 -> {-y ** -n, -x ** -n}
    end
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, {nn, dn}), do: Float.pow(x / 1, nn) |> Float.pow(1 / dn)

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce({n, d}) do
    c = gcd(n, d)

    cond do
      div(n, c) * div(d, c) > 0 && div(n, c) > 0 -> {div(n, c), div(d, c)}
      div(n, c) * div(d, c) > 0 && div(n, c) < 0 -> {-div(n, c), -div(d, c)}
      div(n, c) * div(d, c) < 0 && div(n, c) > 0 -> {-div(n, c), -div(d, c)}
      div(n, c) * div(d, c) < 0 && div(n, c) < 0 -> {div(n, c), div(d, c)}
      true -> {div(n, c), div(d, c)}
    end
  end

  defp gcd(x, 0), do: x
  defp gcd(x, y), do: gcd(y, rem(x, y))
end

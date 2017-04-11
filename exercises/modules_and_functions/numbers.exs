defmodule Numbers do
  def sum(0) do
    0
  end

  def sum(n) do
    n + sum(n-1)
  end

  def gcd(x, 0) do
    x
  end

  def gcd(x, y) do
    gcd(y, rem(x, y))
  end
end

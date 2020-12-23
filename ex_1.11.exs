defmodule F do
  def f_recursive(n) when n < 3, do: n
  def f_recursive(n), do: f_recursive(n - 1) + 2 * f_recursive(n - 2) + 3 * f_recursive(n - 3)

  def f_iterative(n), do: f_iterative(2, 1, 0, n - 2)
  def f_iterative(a, b, c, 0), do: a
  def f_iterative(a, b, c, n), do: f_iterative(a + 2 * b + 3 * c, a, b, n - 1)
end

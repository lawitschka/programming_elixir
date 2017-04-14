# Implement the following Enum functions using no library functions or list
# comprehensions: all?, each, filter, split, and take. You may need to use an if
# statement to implement filter. The syntax for this is
#
# ​   ​if​ condition ​do​
# ​     expression(s)
# ​   ​else​
# ​     expression(s)
# ​   ​end​

defmodule MyEnum do

  def all?([], _), do: true
  def all?([head | tail], func), do: func.(head) and all?(tail, func)

  def each([], _), do: :ok
  def each([head | tail], func) do
    func.(head)
    each(tail, func)
  end

  def filter([], _), do: []
  def filter([head | tail], func) do
    if func.(head) do
      [head | filter(tail, func)]
    else
      filter(tail, func)
    end
  end

  def split(list, n) when n >= 0 do
    _split([], list, n)
  end
  def split(list, n) when n < 0 do
    _split([], list, max(length(list) + n, 0))
  end

  defp _split(front, back, 0) do
    {front, back}
  end
  defp _split(front, [], _) do
    {front, []}
  end
  defp _split(front, [head | tail], left_to_take) do
    _split(front ++ [head], tail, left_to_take - 1)
  end

  def take(list, n) when n >= 0 do
    _take([], list, n)
  end
  # def take(list, n) when n < 0 do
  #   _take([], list, max(length(list) + n, 0))
  # end

  defp _take(taken, _, 0) do
    taken
  end
  defp _take(taken, [], _) do
    taken
  end
  defp _take(taken, [head | tail], left_to_take) do
    _take(taken ++ [head], tail, left_to_take - 1)
  end

end

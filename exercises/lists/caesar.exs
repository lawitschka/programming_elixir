# An Elixir single-quoted string is actually a list of individual character
# codes. Write a caesar(list, n) function that adds n to each list element,
# wrapping if the addition results in a character greater than z.
#
# ​	​iex>​ MyList.caesar(​'ryvkve'​, 13)
# ​	?????? :)

defmodule MyList do

  def caesar([], _) do
    ' :)'
  end
  def caesar([head | tail], n) when head + n <= 122 do
    [head + n | caesar(tail, n)]
  end
  def caesar([head | tail], n) when head + n > 122 do
    [96 + head + n - 122 | caesar(tail, n)]
  end

end

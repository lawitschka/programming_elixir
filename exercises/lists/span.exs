# Write a function MyList.span(from, to) that returns a list of the numbers
# from from up to to.

defmodule MyList do

  def span(from, to), do: _span(to, from)

  defp _span(to, to), do: [to]
  defp _span(to, current), do: [current | _span(to, current + 1)]

end

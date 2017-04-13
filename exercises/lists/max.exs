defmodule MyList do

  def max(list), do: _max(list)

  defp _max(list, current_max \\ :"-inf")
  defp _max([], current_max) do
    current_max
  end
  defp _max([head | tail], current_max)
  when current_max == :"-inf" or current_max < head do
    _max(tail, head)
  end
  defp _max([head | tail], current_max) when current_max >= head do
    _max(tail, current_max)
  end

end

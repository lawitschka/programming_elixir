defmodule MyString do

  def printable?([]), do: true
  def printable?([head | tail]), do: head in ?\s..?~ and printable?(tail)

end

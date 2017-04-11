defmodule Chop do
  # Break condition
  def guess(actual, start_range..end_range)
  when start_range == actual and end_range == actual do
    IO.puts actual
  end

  def guess(actual, range) do
    new_guess = new_guess(range)
    IO.puts "Is it #{new_guess}?"
    new_range = new_range(actual, range, new_guess)
    guess(actual, new_range)
  end

  defp new_guess(min..max) do
    div(min, 2) + div(max, 2)
  end

  defp new_range(actual, min.._, current_guess)
  when actual < current_guess do
    min..(current_guess - 1)
  end

  defp new_range(actual, _..max, current_guess)
  when actual > current_guess do
    (current_guess + 1)..max
  end

  defp new_range(actual, _, current_guess)
  when actual == current_guess do
    current_guess..current_guess
  end
end

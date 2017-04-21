defmodule Parallel do
  def pmap(collection, fun) do
    me = self()

    collection
    |> Enum.map(fn (elem) ->
        spawn_link fn -> (send me, { self(), fun.(elem) }) end
      end)
    |> Enum.map(fn (pid) ->
        receive do
          { ^pid, result } -> result
        end
      end)
  end
end

# Exercise 7:
# Change `^pid` to `_pid` and use the following to see, how this can fail:
#   Parallel.pmap 1..100, fn x ->
#     :timer.sleep round(:rand.uniform() * 100)
#     x * x
#   end

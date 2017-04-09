fizz_buzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
  (_, _, n) -> n
end

solution = fn(n) -> fizz_buzz.(rem(n, 3), rem(n, 5), n) end

IO.puts solution.(10)
IO.puts solution.(11)
IO.puts solution.(12)
IO.puts solution.(13)
IO.puts solution.(14)
IO.puts solution.(15)
IO.puts solution.(16)

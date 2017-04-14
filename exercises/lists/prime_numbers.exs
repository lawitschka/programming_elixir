n = 10

for x <- 2..n, x == 2 or Enum.all?(2..x-1, fn y -> rem(x, y) != 0 end), do: x

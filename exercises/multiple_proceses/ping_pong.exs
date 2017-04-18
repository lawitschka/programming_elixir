# Write a program that spawns two processes and then passes each a unique token
# (for example, “fred” and “betty”). Have them send the tokens back.
#
# - Is the order in which the replies are received deterministic in theory? In
#   practice?
# - If either answer is no, how could you make it so?

defmodule Echo do
  def do_echo do
    receive do
      { sender, msg } ->
        IO.puts "Echo service received: #{msg}"
        send(sender, msg)
    end
  end
end

defmodule Receiver do
  def receive_echo do
    receive do
      msg ->
        IO.puts msg
        receive_echo()
    end
  end
end

echo1 = spawn(Echo, :do_echo, [])
echo2 = spawn(Echo, :do_echo, [])

send(echo1, { self(), "fred" })
send(echo2, { self(), "betty" })

Receiver.receive_echo()
